param(
    [string]$Device
)

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$pubspecPath = Join-Path $PSScriptRoot 'pubspec.yaml'

if (-not (Test-Path -LiteralPath $pubspecPath)) {
    Write-Error "Не найден pubspec.yaml"
    exit 1
}

$pubspec = [System.IO.File]::ReadAllText($pubspecPath, $utf8NoBom)

$versionMatch = [regex]::Match(
    $pubspec,
    '(?m)^version:\s*([0-9]+\.[0-9]+\.[0-9]+(?:\+[0-9]+)?)'
)

if (-not $versionMatch.Success) {
    Write-Error 'В pubspec.yaml не найдена корректная строка version:'
    exit 1
}

$oldVersion = $versionMatch.Groups[1].Value

Write-Host ''
Write-Host "Прошлая версия: $oldVersion" -ForegroundColor Cyan

$inputVersion = Read-Host 'Новая версия (Enter = оставить прошлую)'

if ([string]::IsNullOrWhiteSpace($inputVersion)) {
    $newVersion = $oldVersion
} else {
    $newVersion = $inputVersion.Trim()
}

if ($newVersion -notmatch '^[0-9]+\.[0-9]+\.[0-9]+(\+[0-9]+)?$') {
    Write-Error 'Неверный формат версии. Пример: 0.4.5 или 0.4.5+1'
    exit 1
}

# Если ввели 0.5.0, а была 0.4.5+1, сохраним build-номер: 0.5.0+1
if (($newVersion -notmatch '\+') -and ($oldVersion -match '\+([0-9]+)$')) {
    $newVersion = "$newVersion+$($Matches[1])"
}

if ($newVersion -ne $oldVersion) {
    $pubspec = $pubspec -replace '(?m)^version:[^\r\n]*$', "version: $newVersion"
    [System.IO.File]::WriteAllText($pubspecPath, $pubspec, $utf8NoBom)

    Write-Host "Версия изменена: $oldVersion -> $newVersion" -ForegroundColor Green
} else {
    Write-Host "Собираю версию: $newVersion" -ForegroundColor Green
}

Write-Host ''
Write-Host 'Сборка APK...' -ForegroundColor Yellow

flutter build apk --release

if ($LASTEXITCODE -ne 0) {
    Write-Error 'Ошибка сборки APK.'
    exit 1
}

$apkPath = Join-Path $PSScriptRoot 'build\app\outputs\flutter-apk\app-release.apk'

if (-not (Test-Path -LiteralPath $apkPath)) {
    Write-Error "APK не найден: $apkPath"
    exit 1
}

Write-Host "APK собран: $apkPath" -ForegroundColor Green

# ---------------------------------------------------------
# Копируем APK с версией в имени файла
# ---------------------------------------------------------

$safeVersion = ($newVersion -replace '[^0-9A-Za-z._-]', '-')

$versionedApkPath = Join-Path $PSScriptRoot "build\app\outputs\flutter-apk\aquarium_journal-$safeVersion-release.apk"

Copy-Item -LiteralPath $apkPath -Destination $versionedApkPath -Force

Write-Host "APK с версией: $versionedApkPath" -ForegroundColor Green

# Дальше устанавливаем уже файл с версией
$apkPath = $versionedApkPath

# ---------------------------------------------------------
# Ищем adb
# ---------------------------------------------------------

$adb = (Get-Command adb -ErrorAction SilentlyContinue).Source

if (-not $adb) {
    $sdk = $env:ANDROID_HOME

    if (-not $sdk) {
        $sdk = $env:ANDROID_SDK_ROOT
    }

    if (-not $sdk) {
        $propsPath = Join-Path $PSScriptRoot 'android\local.properties'

        if (Test-Path -LiteralPath $propsPath) {
            $props = [System.IO.File]::ReadAllText($propsPath, $utf8NoBom)

            $sdkLine = $props -split "`r?`n" |
                Where-Object { $_ -match '^sdk\.dir=' } |
                Select-Object -First 1

            if ($sdkLine) {
                $sdk = ($sdkLine -replace '^sdk\.dir=', '').Trim()
                $sdk = $sdk.Replace('\:', ':').Replace('\\', '\')
            }
        }
    }

    if ($sdk) {
        $candidate = Join-Path $sdk 'platform-tools\adb.exe'

        if (Test-Path -LiteralPath $candidate) {
            $adb = $candidate
        }
    }
}

if (-not $adb) {
    Write-Warning 'adb не найден. Устанавливаю через flutter install, автозапуск будет пропущен.'

    if ($Device) {
        flutter install --release -d $Device
    } else {
        flutter install --release
    }

    exit $LASTEXITCODE
}

# ---------------------------------------------------------
# Выбираем устройство
# ---------------------------------------------------------

if (-not $Device) {
    $devicesOutput = @(& $adb devices)

    $devices = @(
        $devicesOutput |
            Select-Object -Skip 1 |
            Where-Object { $_ -match '\sdevice$' } |
            ForEach-Object { ($_ -split '\s+')[0] }
    )

    if ($devices.Count -eq 0) {
        Write-Error 'Android-устройство не найдено. Подключите телефон.'
        exit 1
    }

    if ($devices.Count -gt 1) {
        Write-Host ''
        Write-Host 'Найдено несколько Android-устройств:' -ForegroundColor Yellow

        for ($i = 0; $i -lt $devices.Count; $i++) {
            Write-Host ("[{0}] {1}" -f ($i + 1), $devices[$i])
        }

        $choice = Read-Host 'Выберите номер устройства (по умолчанию 1)'

        if ([string]::IsNullOrWhiteSpace($choice)) {
            $choice = '1'
        }

        $index = 0

        if ([int]::TryParse($choice, [ref]$index)) {
            $index = $index - 1
        } else {
            $index = 0
        }

        if ($index -lt 0 -or $index -ge $devices.Count) {
            $index = 0
        }

        $Device = $devices[$index]
    } else {
        $Device = $devices[0]
    }
}

Write-Host ''
Write-Host "Устройство: $Device" -ForegroundColor Cyan

# ---------------------------------------------------------
# Устанавливаем APK
# ---------------------------------------------------------

Write-Host 'Установка APK...' -ForegroundColor Yellow

& $adb -s $Device install -r $apkPath

if ($LASTEXITCODE -ne 0) {
    Write-Error 'Ошибка установки APK.'
    exit 1
}

Write-Host 'APK установлен.' -ForegroundColor Green

# ---------------------------------------------------------
# Определяем package name
# ---------------------------------------------------------

$packageId = $null

$gradlePath = Join-Path $PSScriptRoot 'android\app\build.gradle'

if (Test-Path -LiteralPath $gradlePath) {
    $gradle = [System.IO.File]::ReadAllText($gradlePath, $utf8NoBom)

    $match = [regex]::Match(
        $gradle,
        'applicationId\s*=?\s*["'']([^"'']+)["'']'
    )

    if ($match.Success) {
        $packageId = $match.Groups[1].Value
    }
}

if (-not $packageId) {
    $manifestPath = Join-Path $PSScriptRoot 'android\app\src\main\AndroidManifest.xml'

    if (Test-Path -LiteralPath $manifestPath) {
        $manifest = [System.IO.File]::ReadAllText($manifestPath, $utf8NoBom)

        $match = [regex]::Match(
            $manifest,
            'package\s*=\s*["'']([^"'']+)["'']'
        )

        if ($match.Success) {
            $packageId = $match.Groups[1].Value
        }
    }
}

if (-not $packageId) {
    Write-Warning 'Не удалось определить package name. Приложение установлено, но автозапуск пропущен.'
    exit 0
}

Write-Host "Пакет: $packageId" -ForegroundColor Cyan

# ---------------------------------------------------------
# Запускаем приложение
# ---------------------------------------------------------

Write-Host 'Запуск приложения...' -ForegroundColor Yellow

& $adb -s $Device shell monkey -p $packageId -c android.intent.category.LAUNCHER 1

if ($LASTEXITCODE -eq 0) {
    Write-Host ''
    Write-Host "Готово. Версия $newVersion установлена и запущена на $Device." -ForegroundColor Green
} else {
    Write-Warning 'Приложение установлено, но автоматически запустить не удалось.'
}
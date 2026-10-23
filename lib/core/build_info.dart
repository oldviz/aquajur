/// Информация о сборке приложения.
/// Дата сборки подставляется автоматически при выполнении скрипта build.ps1
class BuildInfo {
  /// Дата и время сборки. Подставляется через --dart-define=BUILD_DATE=...
  static const String buildDate = String.fromEnvironment(
    'BUILD_DATE',
    defaultValue: 'Режим разработки',
  );

  /// Канал сборки (debug/release/profile)
  static const bool isRelease = bool.fromEnvironment('dart.vm.product');
}
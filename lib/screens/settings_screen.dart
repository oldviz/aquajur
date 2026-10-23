import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';

import '../core/build_info.dart';
import '../core/app_theme.dart';
import '../database/app_database.dart';
import '../sync/sync_engine.dart';
import '../services/theme_service.dart';

class SettingsScreen extends StatefulWidget {
  final AppDatabase db;

  const SettingsScreen({super.key, required this.db});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final SyncEngine _sync = SyncEngine(widget.db);

  String _deviceId = '…';
  String? _lastSync;
  bool _busy = false;

  String _appVersion = '…';
  String _buildNumber = '…';

  @override
  void initState() {
    super.initState();
    _load();
    _loadPackageInfo();
  }

  Future<void> _load() async {
    final id = await widget.db.deviceId();
    final ls = await widget.db.getMeta('lastSyncAt');

    setState(() {
      _deviceId = id;
      _lastSync = ls;
    });
  }

  Future<void> _loadPackageInfo() async {
    try {
      final info = await PackageInfo.fromPlatform();

      setState(() {
        _appVersion = info.version;
        _buildNumber = info.buildNumber;
      });
    } catch (e) {
      setState(() {
        _appVersion = 'Ошибка';
        _buildNumber = '-';
      });
    }
  }

  void _toast(String msg) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));

  Future<void> _export() async {
    setState(() => _busy = true);

    try {
      final bundle = await widget.db.exportBundle();
      final bytes = utf8.encode(
        const JsonEncoder.withIndent('  ').convert(bundle),
      );

      final file = XFile.fromData(
        bytes,
        name:
            'aquarium_backup_${DateTime.now().millisecondsSinceEpoch}.json',
        mimeType: 'application/json',
      );

      await SharePlus.instance.share(
        ShareParams(
          files: [file],
          text: 'Резервная копия аквариумов',
        ),
      );
    } catch (e) {
      _toast('Ошибка экспорта: $e');
    }

    setState(() => _busy = false);
  }

  Future<void> _import() async {
    final picker = FilePickerPlatform.instance;

    final res = await picker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['json'],
    );

    if (res == null || res.isEmpty) return _toast('Не выбран файл');

    final bytes = await res.single.readAsBytes();

    if (bytes.isEmpty) return _toast('Не удалось прочитать файл');

    setState(() => _busy = true);

    try {
      final bundle =
          jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;

      final report = await widget.db.mergeBundle(bundle);

      _toast('Импорт завершён. ${report.summary}');
    } catch (e) {
      _toast('Ошибка импорта: $e');
    }

    setState(() => _busy = false);
  }

  Future<void> _syncNow() async {
    setState(() => _busy = true);

    try {
      final r = await _sync.syncNow();
      _toast('Синхронизация: ${r.summary}');
      await _load();
    } on StateError catch (e) {
      _toast(e.message);
    } catch (e) {
      _toast('Ошибка синхронизации: $e');
    }

    setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<ThemeService>();
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: _busy
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // --- ТЕМА ---
                _sectionHeader('Внешний вид'),
                const SizedBox(height: 8),
                
                DropdownButtonFormField<AppThemeMode>(
                  value: themeService.mode,
                  decoration: InputDecoration(
                    labelText: 'Тема оформления',
                    border: OutlineInputBorder(),
                  ),
                  items: AppThemeMode.values.map((mode) {
                    return DropdownMenuItem<AppThemeMode>(
                      value: mode,
                      child: Text(mode.label),
                    );
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) themeService.setMode(v);
                  },
                ),

                const Divider(height: 32),

                // --- СИНХРОНИЗАЦИЯ / ДАННЫЕ ---
                _sectionHeader('Данные'),
                const SizedBox(height: 8),
                _tile(Icons.phone_android, 'ID устройства', _deviceId),
                _tile(
                  Icons.sync,
                  'Последняя синхронизация',
                  _lastSync ?? 'никогда',
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: _syncNow,
                  icon: const Icon(Icons.sync),
                  label: const Text('Синхронизировать сейчас'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _export,
                  icon: const Icon(Icons.upload_file),
                  label: const Text('Экспорт (JSON)'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _import,
                  icon: const Icon(Icons.download),
                  label: const Text('Импорт / слияние (JSON)'),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Импорт не затирает данные — он сливает файлы. Более свежая '
                  'запись (по дате изменения) побеждает.',
                  style: TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 32),
                const Divider(height: 1),
                const SizedBox(height: 16),

                // --- О ПРИЛОЖЕНИИ ---
                _sectionHeader('О приложении'),
                const SizedBox(height: 8),
                _infoRow(
                  'Версия',
                  '$_appVersion (сборка $_buildNumber)',
                ),
                _infoRow('Дата сборки', BuildInfo.buildDate),
                _infoRow(
                  'Режим',
                  BuildInfo.isRelease ? 'Release' : 'Debug',
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Aquarium Journal 🐠',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      children: [
        Icon(
          Icons.info_outline,
          size: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _tile(IconData icon, String title, String sub) => ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        subtitle: Text(sub),
      );

  Widget _infoRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 130,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),
          ],
        ),
      );
}
import 'dart:async';

import 'package:flutter/material.dart';

import '../database/app_database.dart';
import 'import_validation.dart';
import 'json_file_bridge.dart';
import 'ui_refresh_signal.dart'; // <-- Новый импорт

class JsonImportHandler {
  final AppDatabase db;
  final GlobalKey<NavigatorState> navigatorKey;

  bool _busy = false;
  AppLifecycleListener? _lifecycleListener;

  JsonImportHandler({
    required this.db,
    required this.navigatorKey,
  });

  void start() {
    _lifecycleListener = AppLifecycleListener(
      onResume: () {
        unawaited(_checkPendingFile());
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_checkPendingFile());
    });
  }

  void dispose() {
    _lifecycleListener?.dispose();
  }

  Future<void> _checkPendingFile() async {
    if (_busy) return;

    if (navigatorKey.currentContext == null) {
      return;
    }

    _busy = true;

    try {
      final file = await JsonFileBridge.takePendingFile();

      if (file == null) {
        return;
      }

      final text = await JsonFileBridge.readText(file);
      final context = navigatorKey.currentContext;

      if (context == null) {
        _showMessage('Приложение ещё не готово. Попробуйте открыть файл снова.');
        return;
      }

      if (text == null || text.trim().isEmpty) {
        _showMessage('Не удалось прочитать выбранный файл.');
        return;
      }

      final validation = validateImportJson(
        text,
        expectedTables: db.syncTables,
      );

      if (!validation.isValid) {
        _showMessage(
          validation.errorMessage ?? 'Файл не подходит для импорта.',
        );
        return;
      }

      await _confirmAndImport(
        context,
        fileName: file.name,
        validation: validation,
      );
    } catch (e) {
      _showMessage('Ошибка обработки файла: $e');
    } finally {
      _busy = false;
    }
  }

  Future<void> _confirmAndImport(
    BuildContext context, {
    required String? fileName,
    required ImportValidationResult validation,
  }) async {
    final bundle = validation.bundle;

    if (bundle == null) {
      return;
    }

    final summary = _buildSummary(validation.rowCounts);

    final confirmed = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Импортировать резервную копию?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (fileName != null && fileName.trim().isNotEmpty) ...[
                Text(
                  'Файл: $fileName',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Text(summary),
              const SizedBox(height: 12),
              const Text(
                'Будут добавлены или обновлены записи. '
                'Существующие более новые записи не будут перезаписаны.',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Отмена'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Импорт'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    try {
      final report = await db.mergeBundle(bundle);
      
      // КРИТИЧЕСКИ ВАЖНО: Сообщаем UI, что данные изменились извне.
      UiRefreshSignal.instance.triggerRefresh();

      _showMessage('Импорт завершён. ${report.summary}');
    } catch (e) {
      _showMessage('Ошибка импорта: $e');
    }
  }

  String _buildSummary(Map<String, int>? counts) {
    if (counts == null || counts.isEmpty) {
      return 'В файле нет известных таблиц.';
    }

    final entries = counts.entries.where((e) => e.value > 0).toList();

    if (entries.isEmpty) {
      return 'В файле нет записей.';
    }

    return entries
        .map(
          (e) => '${_friendlyTableName(e.key)} — ${e.value}',
        )
        .join('\n');
  }

  String _friendlyTableName(String table) {
    switch (table) {
      case 'aquariums':
        return 'Аквариумы';
      case 'aquarium_lights':
        return 'Освещение';
      case 'test_types':
        return 'Типы тестов';
      case 'water_tests':
        return 'Тесты воды';
      case 'fertilizer_types':
        return 'Типы удобрений';
      case 'fertilizer_applications':
        return 'Внесения удобрений';
      case 'maintenance_records':
        return 'Обслуживание';
      case 'hydrobionts':
        return 'Обитатели';
      case 'notes':
        return 'Заметки';
      default:
        return table;
    }
  }

  void _showMessage(String message) {
    final context = navigatorKey.currentContext;

    if (context == null) {
      return;
    }

    final messenger = ScaffoldMessenger.maybeOf(context);

    messenger?.clearSnackBars();
    messenger?.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
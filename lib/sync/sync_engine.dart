// sync_engine.dart
import '../database/app_database.dart';
import 'sync_provider.dart';

class SyncEngine {
  final AppDatabase db;
  SyncProvider provider;
  SyncEngine(this.db, {SyncProvider? provider})
      : provider = provider ?? DisabledSyncProvider();

  Future<SyncReport> syncNow() async {
    if (!provider.isConfigured) {
      throw StateError('Синхронизация не настроена. Используйте экспорт/импорт.');
    }
    var report = const SyncReport(0, 0, 0);

    // 1. Тянем удалённые изменения и сливаем (LWW по updatedAt)
    final remote = await provider.pull();
    if (remote != null) report = await db.mergeBundle(remote);

    // 2. Отдаём локальное состояние
    await provider.push(await db.exportBundle());

    await db.setMeta('lastSyncAt', DateTime.now().toIso8601String());
    return report;
  }
}
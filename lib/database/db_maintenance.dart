part of 'app_database.dart';

extension MaintenanceRepo on AppDatabase {
  Future<void> softDeleteMaintenance(String id) =>
      (update(maintenanceRecords)..where((t) => t.id.equals(id)))
          .write(MaintenanceRecordsCompanion(
    deleted: const Value(true),
    updatedAt: Value(DateTime.now()),
  ));

  Stream<List<MaintenanceRecord>> watchMaintenance(String aquariumId) =>
      (select(maintenanceRecords)
            ..where((t) =>
                t.aquariumId.equals(aquariumId) & t.deleted.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.actionDate)]))
          .watch();

  Future<void> saveMaintenance(
    String aquariumId,
    String? id,
    String type,
    double amount,
    DateTime date,
  ) async {
    final now = DateTime.now();

    await into(maintenanceRecords).insert(
      MaintenanceRecordsCompanion.insert(
        id: id ?? newId(),
        aquariumId: aquariumId,
        maintenanceType: type,
        volumeOrAmount: amount,
        actionDate: date,
        updatedAt: now,
        deleted: const Value(false),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}
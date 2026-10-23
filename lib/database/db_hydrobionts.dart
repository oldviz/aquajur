part of 'app_database.dart';

extension HydrobiontsRepo on AppDatabase {
  Future<void> softDeleteHydrobiont(String id) =>
      (update(hydrobionts)..where((t) => t.id.equals(id)))
          .write(HydrobiontsCompanion(
    deleted: const Value(true),
    updatedAt: Value(DateTime.now()),
  ));

  Stream<List<Hydrobiont>> watchHydrobionts(String aquariumId) =>
      (select(hydrobionts)
            ..where((t) =>
                t.aquariumId.equals(aquariumId) & t.deleted.equals(false))
            ..orderBy([(t) => OrderingTerm.desc(t.actionDate)]))
          .watch();

  Future<void> saveHydrobiont(
    String aquariumId,
    String? id,
    String species,
    int qty,
    String action,
    String hType,
    DateTime date,
  ) async {
    final now = DateTime.now();

    await into(hydrobionts).insert(
      HydrobiontsCompanion.insert(
        id: id ?? newId(),
        aquariumId: aquariumId,
        species: species,
        quantity: qty,
        action: action,
        hydrobiontType: hType,
        actionDate: date,
        updatedAt: now,
        deleted: const Value(false),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}
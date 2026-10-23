part of 'app_database.dart';

extension FertilizersRepo on AppDatabase {
  Future<void> softDeleteFertilizer(String id) =>
      (update(fertilizerApplications)..where((t) => t.id.equals(id)))
          .write(FertilizerApplicationsCompanion(
    deleted: const Value(true),
    updatedAt: Value(DateTime.now()),
  ));

  Stream<List<FertilizerType>> watchFertilizerTypes() {
    return (select(fertilizerTypes)
          ..where((t) => t.deleted.equals(false))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .watch()
        .map((rows) {
      final seen = <String>{};

      return [
        for (final t in rows)
          if (seen.add(t.name)) t,
      ];
    });
  }

  Future<String> addFertilizerType(String name) async {
    final trimmed = name.trim();

    if (trimmed.isEmpty) {
      return '';
    }

    final existing = await (select(fertilizerTypes)
          ..where((t) => t.name.equals(trimmed)))
        .getSingleOrNull();

    if (existing != null) {
      if (existing.deleted) {
        await (update(fertilizerTypes)
              ..where((t) => t.id.equals(existing.id)))
            .write(FertilizerTypesCompanion(
          deleted: const Value(false),
          updatedAt: Value(DateTime.now()),
        ));
      }

      return existing.id;
    }

    final id = newId();

    await into(fertilizerTypes).insert(
      FertilizerTypesCompanion.insert(
        id: id,
        name: trimmed,
        isDefault: false,
        updatedAt: DateTime.now(),
      ),
    );

    return id;
  }

  Stream<List<FertilizerApplicationWithTypeName>> watchFertilizers(
    String aquariumId,
  ) {
    final q = select(fertilizerApplications).join([
      innerJoin(
        fertilizerTypes,
        fertilizerTypes.id.equalsExp(fertilizerApplications.fertilizerTypeId),
      ),
    ])
      ..where(fertilizerApplications.aquariumId.equals(aquariumId) &
          fertilizerApplications.deleted.equals(false))
      ..orderBy([OrderingTerm.desc(fertilizerApplications.actionDate)]);

    return q.watch().map((rows) => [
          for (final r in rows)
            FertilizerApplicationWithTypeName(
              r.readTable(fertilizerApplications),
              r.readTable(fertilizerTypes).name,
            ),
        ]);
  }

  Future<void> saveFertilizer(
    String aquariumId,
    String? id,
    String fertilizerTypeId,
    double dosage,
    double totalAmount,
    DateTime date,
  ) async {
    final now = DateTime.now();

    await into(fertilizerApplications).insert(
      FertilizerApplicationsCompanion.insert(
        id: id ?? newId(),
        aquariumId: aquariumId,
        fertilizerTypeId: fertilizerTypeId,
        dosage: dosage,
        totalAmount: totalAmount,
        actionDate: date,
        updatedAt: now,
        deleted: const Value(false),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}
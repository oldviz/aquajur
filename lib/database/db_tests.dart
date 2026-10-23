part of 'app_database.dart';

extension TestsRepo on AppDatabase {
  Future<void> softDeleteTest(String id) =>
      (update(waterTests)..where((t) => t.id.equals(id)))
          .write(WaterTestsCompanion(
    deleted: const Value(true),
    updatedAt: Value(DateTime.now()),
  ));

  Stream<List<TestType>> watchTestTypes() {
    return (select(testTypes)
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

  Future<String> addTestType(String name) async {
    final trimmed = name.trim();

    if (trimmed.isEmpty) {
      return '';
    }

    final existing = await (select(testTypes)
          ..where((t) => t.name.equals(trimmed)))
        .getSingleOrNull();

    if (existing != null) {
      if (existing.deleted) {
        await (update(testTypes)
              ..where((t) => t.id.equals(existing.id)))
            .write(TestTypesCompanion(
          deleted: const Value(false),
          updatedAt: Value(DateTime.now()),
        ));
      }

      return existing.id;
    }

    final id = newId();

    await into(testTypes).insert(
      TestTypesCompanion.insert(
        id: id,
        name: trimmed,
        isDefault: false,
        updatedAt: DateTime.now(),
      ),
    );

    return id;
  }

  Stream<List<WaterTestWithTypeName>> watchTests(String aquariumId) {
    final q = select(waterTests).join([
      innerJoin(testTypes, testTypes.id.equalsExp(waterTests.testTypeId)),
    ])
      ..where(waterTests.aquariumId.equals(aquariumId) &
          waterTests.deleted.equals(false))
      ..orderBy([OrderingTerm.desc(waterTests.testDate)]);

    return q.watch().map((rows) => [
          for (final r in rows)
            WaterTestWithTypeName(
              r.readTable(waterTests),
              r.readTable(testTypes).name,
            ),
        ]);
  }

  Future<void> saveTest(
    String aquariumId,
    String? id,
    String testTypeId,
    String value,
    DateTime date,
  ) async {
    final now = DateTime.now();

    await into(waterTests).insert(
      WaterTestsCompanion.insert(
        id: id ?? newId(),
        aquariumId: aquariumId,
        testTypeId: testTypeId,
        value: value,
        testDate: date,
        updatedAt: now,
        deleted: const Value(false),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}
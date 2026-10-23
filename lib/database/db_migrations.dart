part of 'app_database.dart';

extension DbMigrations on AppDatabase {
  Future<void> seedDefaults() async {
    final now = DateTime.now();

    for (final type in Catalog.defaultTestTypes) {
      await into(testTypes).insert(
        TestTypesCompanion.insert(
          id: type.id,
          name: type.name,
          isDefault: true,
          updatedAt: now,
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }

    for (final type in Catalog.defaultFertilizerTypes) {
      await into(fertilizerTypes).insert(
        FertilizerTypesCompanion.insert(
          id: type.id,
          name: type.name,
          isDefault: true,
          updatedAt: now,
        ),
        mode: InsertMode.insertOrIgnore,
      );
    }
  }

  Future<void> resetSchema(Migrator m) async {
    final tablesToDrop = <String>[
      notes.actualTableName,
      'notes',

      hydrobionts.actualTableName,
      'hydrobionts',

      maintenanceRecords.actualTableName,
      'maintenance_records',
      'maintenanceRecords',

      fertilizerApplications.actualTableName,
      'fertilizer_applications',
      'fertilizerApplications',

      waterTests.actualTableName,
      'water_tests',
      'waterTests',

      aquariumLights.actualTableName,
      'aquarium_lights',
      'aquariumLights',

      'water_changes',
      'waterChanges',

      fertilizerTypes.actualTableName,
      'fertilizer_types',
      'fertilizerTypes',

      testTypes.actualTableName,
      'test_types',
      'testTypes',

      aquariums.actualTableName,
      'aquariums',

      syncMeta.actualTableName,
      'sync_meta',
      'syncMeta',
    ];

    for (final table in tablesToDrop) {
      await m.database.customStatement('DROP TABLE IF EXISTS "$table"');
    }

    await m.createAll();
    await seedDefaults();
  }

  /// Обновляет старые метки до единого формата `КОД: Название`.
  Future<void> migrateLegacyLabels() async {
    final testTable = testTypes.actualTableName;
    final fertilizerTable = fertilizerTypes.actualTableName;

    // Старые тесты вида:
    // NH - Аммиак / Аммоний
    // превращаем в:
    // NH: Аммиак / Аммоний
    await customStatement(
      'UPDATE "$testTable" '
      'SET "name" = replace("name", ?, ?) '
      'WHERE "name" LIKE ? AND "name" NOT LIKE ?',
      [' - ', ': ', '% - %', '%:%'],
    );

    // Известные старые удобрения.
    const fertilizerReplacements = <String, String>{
      'NPK Макро': 'NPK: Макро',
      'Микро': 'MICRO: Микроэлементы',
      'Fe Железо': 'Fe: Железо',
      'K Калий': 'K: Калий',
      'C Углерод': 'C: Углерод',
    };

    for (final entry in fertilizerReplacements.entries) {
      await customStatement(
        'UPDATE "$fertilizerTable" SET "name" = ? WHERE "name" = ?',
        [entry.value, entry.key],
      );
    }

    // Универсальная конвертация для удобрений вида:
    // CODE Name
    // в:
    // CODE: Name
    await customStatement(
      'UPDATE "$fertilizerTable" '
      'SET "name" = '
      'substr("name", 1, instr("name", ?) - 1) || ? || '
      'substr("name", instr("name", ?) + 1) '
      'WHERE "name" NOT LIKE ? AND instr("name", ?) > 0',
      [' ', ': ', ' ', '%:%', ' '],
    );
  }

  /// Удаляет дубликаты типов тестов и удобрений по названию.
  ///
  /// Оставляет одну запись на каждое название, предпочитая не удалённые записи.
  Future<void> dedupeTypeNames() async {
    await _dedupeTypeTable(
      typeTable: testTypes.actualTableName,
      typeId: testTypes.id.name,
      typeName: testTypes.name.name,
      typeDeleted: testTypes.deleted.name,
      childTable: waterTests.actualTableName,
      childFK: waterTests.testTypeId.name,
    );

    await _dedupeTypeTable(
      typeTable: fertilizerTypes.actualTableName,
      typeId: fertilizerTypes.id.name,
      typeName: fertilizerTypes.name.name,
      typeDeleted: fertilizerTypes.deleted.name,
      childTable: fertilizerApplications.actualTableName,
      childFK: fertilizerApplications.fertilizerTypeId.name,
    );
  }

  Future<void> _dedupeTypeTable({
    required String typeTable,
    required String typeId,
    required String typeName,
    required String typeDeleted,
    required String childTable,
    required String childFK,
  }) async {
    // Сначала переводим все дочерние записи на canonical id для каждого name.
    await customStatement('''
      UPDATE "$childTable"
      SET "$childFK" = (
        SELECT t2."$typeId"
        FROM "$typeTable" t2
        WHERE t2."$typeName" = (
          SELECT t1."$typeName"
          FROM "$typeTable" t1
          WHERE t1."$typeId" = "$childTable"."$childFK"
        )
        ORDER BY t2."$typeDeleted" ASC, t2."$typeId" ASC
        LIMIT 1
      )
      WHERE "$childFK" IN (
        SELECT "$typeId" FROM "$typeTable"
      );
    ''');

    // Затем удаляем все дублирующиеся type-записи.
    await customStatement('''
      DELETE FROM "$typeTable"
      WHERE "$typeId" NOT IN (
        SELECT keep."$typeId"
        FROM "$typeTable" keep
        WHERE keep."$typeId" = (
          SELECT t2."$typeId"
          FROM "$typeTable" t2
          WHERE t2."$typeName" = keep."$typeName"
          ORDER BY t2."$typeDeleted" ASC, t2."$typeId" ASC
          LIMIT 1
        )
      );
    ''');
  }
}
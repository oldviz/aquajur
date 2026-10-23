part of 'app_database.dart';

class _SyncTableTarget {
  final String table;
  final String idColumn;
  final String updatedAtColumn;
  final Future<void> Function(Map<String, dynamic> row) upsert;

  _SyncTableTarget({
    required this.table,
    required this.idColumn,
    required this.updatedAtColumn,
    required this.upsert,
  });
}

extension DbSync on AppDatabase {
  List<String> get syncTables => [
        aquariums.actualTableName,
        aquariumLights.actualTableName,
        testTypes.actualTableName,
        waterTests.actualTableName,
        fertilizerTypes.actualTableName,
        fertilizerApplications.actualTableName,
        maintenanceRecords.actualTableName,
        hydrobionts.actualTableName,
        notes.actualTableName,
      ];

  Map<String, List<String>> get dateCols => {
        aquariums.actualTableName: [
          aquariums.createdAt.name,
          aquariums.updatedAt.name,
        ],
        aquariumLights.actualTableName: [
          aquariumLights.updatedAt.name,
        ],
        testTypes.actualTableName: [
          testTypes.updatedAt.name,
        ],
        waterTests.actualTableName: [
          waterTests.testDate.name,
          waterTests.updatedAt.name,
        ],
        fertilizerTypes.actualTableName: [
          fertilizerTypes.updatedAt.name,
        ],
        fertilizerApplications.actualTableName: [
          fertilizerApplications.actionDate.name,
          fertilizerApplications.updatedAt.name,
        ],
        maintenanceRecords.actualTableName: [
          maintenanceRecords.actionDate.name,
          maintenanceRecords.updatedAt.name,
        ],
        hydrobionts.actualTableName: [
          hydrobionts.actionDate.name,
          hydrobionts.updatedAt.name,
        ],
        notes.actualTableName: [
          notes.noteDate.name,
          notes.updatedAt.name,
        ],
      };

  Future<String> deviceId() async {
    final row = await (select(syncMeta)
          ..where((t) => t.key.equals('deviceId')))
        .getSingleOrNull();

    if (row != null) return row.value;

    final id = newId();
    await setMeta('deviceId', id);
    return id;
  }

  Future<void> setMeta(String k, String v) => into(syncMeta).insert(
        SyncMetaCompanion.insert(key: k, value: v),
        mode: InsertMode.insertOrReplace,
      );

  Future<String?> getMeta(String k) async =>
      (await (select(syncMeta)..where((t) => t.key.equals(k)))
          .getSingleOrNull())
          ?.value;

  Future<Map<String, dynamic>> exportBundle() async {
    final out = <String, dynamic>{
      'format': 1,
      'deviceId': await deviceId(),
      'exportedAt': DateTime.now().toIso8601String(),
    };

    for (final t in syncTables) {
      final rows = await customSelect('SELECT * FROM "$t"').get();
      final cols = dateCols[t]!;

      out[t] = [
        for (final r in rows)
          {
            for (final e in r.data.entries)
              e.key: (cols.contains(e.key) && e.value is int)
                  ? DateTime.fromMillisecondsSinceEpoch(
                          (e.value as int) * 1000,
                        )
                      .toIso8601String()
                  : e.value,
          },
      ];
    }

    return out;
  }

  Future<SyncReport> mergeBundle(Map<String, dynamic> bundle) async {
    var ins = 0;
    var upd = 0;
    var skip = 0;

    final targets = _syncTargets();

    await transaction(() async {
      for (final target in targets) {
        final rows = (bundle[target.table] as List?) ?? const [];

        for (final raw in rows) {
          if (raw is! Map) {
            skip++;
            continue;
          }

          final row = Map<String, dynamic>.from(raw);
          final id = _asString(row[target.idColumn]);

          if (id.isEmpty) {
            skip++;
            continue;
          }

          final incoming = _asUnixSeconds(row[target.updatedAtColumn]);

          final existing = await customSelect(
            'SELECT "${target.updatedAtColumn}" '
            'FROM "${target.table}" '
            'WHERE "${target.idColumn}" = ? '
            'LIMIT 1',
            variables: [Variable.withString(id)],
          ).get();

          final local = existing.isEmpty
              ? null
              : _asUnixSeconds(existing.first.data[target.updatedAtColumn]);

          if (local == null) {
            await target.upsert(row);
            ins++;
          } else if (incoming > local) {
            await target.upsert(row);
            upd++;
          } else {
            skip++;
          }
        }
      }
    });

    // После импорта автоматически убираем возможные дубли типов по названию.
    await dedupeTypeNames();

    return SyncReport(ins, upd, skip);
  }

  List<_SyncTableTarget> _syncTargets() {
    return [
      _SyncTableTarget(
        table: aquariums.actualTableName,
        idColumn: aquariums.id.name,
        updatedAtColumn: aquariums.updatedAt.name,
        upsert: (row) async {
          await into(aquariums).insert(
            _aquariumFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: aquariumLights.actualTableName,
        idColumn: aquariumLights.id.name,
        updatedAtColumn: aquariumLights.updatedAt.name,
        upsert: (row) async {
          await into(aquariumLights).insert(
            _lightFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: testTypes.actualTableName,
        idColumn: testTypes.id.name,
        updatedAtColumn: testTypes.updatedAt.name,
        upsert: (row) async {
          await into(testTypes).insert(
            _testTypeFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: waterTests.actualTableName,
        idColumn: waterTests.id.name,
        updatedAtColumn: waterTests.updatedAt.name,
        upsert: (row) async {
          await into(waterTests).insert(
            _waterTestFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: fertilizerTypes.actualTableName,
        idColumn: fertilizerTypes.id.name,
        updatedAtColumn: fertilizerTypes.updatedAt.name,
        upsert: (row) async {
          await into(fertilizerTypes).insert(
            _fertilizerTypeFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: fertilizerApplications.actualTableName,
        idColumn: fertilizerApplications.id.name,
        updatedAtColumn: fertilizerApplications.updatedAt.name,
        upsert: (row) async {
          await into(fertilizerApplications).insert(
            _fertilizerApplicationFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: maintenanceRecords.actualTableName,
        idColumn: maintenanceRecords.id.name,
        updatedAtColumn: maintenanceRecords.updatedAt.name,
        upsert: (row) async {
          await into(maintenanceRecords).insert(
            _maintenanceRecordFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: hydrobionts.actualTableName,
        idColumn: hydrobionts.id.name,
        updatedAtColumn: hydrobionts.updatedAt.name,
        upsert: (row) async {
          await into(hydrobionts).insert(
            _hydrobiontFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
      _SyncTableTarget(
        table: notes.actualTableName,
        idColumn: notes.id.name,
        updatedAtColumn: notes.updatedAt.name,
        upsert: (row) async {
          await into(notes).insert(
            _noteFromRow(row),
            mode: InsertMode.insertOrReplace,
          );
        },
      ),
    ];
  }

  AquariumsCompanion _aquariumFromRow(Map<String, dynamic> row) {
    return AquariumsCompanion.insert(
      id: _asString(row[aquariums.id.name]),
      name: _asString(row[aquariums.name.name]),
      volume: _asInt(row[aquariums.volume.name]),
      lengthCm: _asDouble(row[aquariums.lengthCm.name]),
      widthCm: _asDouble(row[aquariums.widthCm.name]),
      heightCm: _asDouble(row[aquariums.heightCm.name]),
      launchDate: Value(_asNullableDate(row[aquariums.launchDate.name])),
      createdAt: _asDate(row[aquariums.createdAt.name]),
      updatedAt: _asDate(row[aquariums.updatedAt.name]),
      deleted: Value(_asBool(row[aquariums.deleted.name])),
    );
  }

  AquariumLightsCompanion _lightFromRow(Map<String, dynamic> row) {
    return AquariumLightsCompanion.insert(
      id: _asString(row[aquariumLights.id.name]),
      aquariumId: _asString(row[aquariumLights.aquariumId.name]),
      lightType: _asString(row[aquariumLights.lightType.name]),
      powerW: _asDouble(row[aquariumLights.powerW.name]),
      startTime: _asString(row[aquariumLights.startTime.name]),
      endTime: _asString(row[aquariumLights.endTime.name]),
      updatedAt: _asDate(row[aquariumLights.updatedAt.name]),
      deleted: Value(_asBool(row[aquariumLights.deleted.name])),
    );
  }

  TestTypesCompanion _testTypeFromRow(Map<String, dynamic> row) {
    return TestTypesCompanion.insert(
      id: _asString(row[testTypes.id.name]),
      name: _asString(row[testTypes.name.name]),
      isDefault: _asBool(row[testTypes.isDefault.name]),
      updatedAt: _asDate(row[testTypes.updatedAt.name]),
      deleted: Value(_asBool(row[testTypes.deleted.name])),
    );
  }

  WaterTestsCompanion _waterTestFromRow(Map<String, dynamic> row) {
    return WaterTestsCompanion.insert(
      id: _asString(row[waterTests.id.name]),
      aquariumId: _asString(row[waterTests.aquariumId.name]),
      testTypeId: _asString(row[waterTests.testTypeId.name]),
      value: _asString(row[waterTests.value.name]),
      testDate: _asDate(row[waterTests.testDate.name]),
      updatedAt: _asDate(row[waterTests.updatedAt.name]),
      deleted: Value(_asBool(row[waterTests.deleted.name])),
    );
  }

  FertilizerTypesCompanion _fertilizerTypeFromRow(Map<String, dynamic> row) {
    return FertilizerTypesCompanion.insert(
      id: _asString(row[fertilizerTypes.id.name]),
      name: _asString(row[fertilizerTypes.name.name]),
      isDefault: _asBool(row[fertilizerTypes.isDefault.name]),
      updatedAt: _asDate(row[fertilizerTypes.updatedAt.name]),
      deleted: Value(_asBool(row[fertilizerTypes.deleted.name])),
    );
  }

  FertilizerApplicationsCompanion _fertilizerApplicationFromRow(
    Map<String, dynamic> row,
  ) {
    return FertilizerApplicationsCompanion.insert(
      id: _asString(row[fertilizerApplications.id.name]),
      aquariumId: _asString(row[fertilizerApplications.aquariumId.name]),
      fertilizerTypeId:
          _asString(row[fertilizerApplications.fertilizerTypeId.name]),
      dosage: _asDouble(row[fertilizerApplications.dosage.name]),
      totalAmount: _asDouble(row[fertilizerApplications.totalAmount.name]),
      actionDate: _asDate(row[fertilizerApplications.actionDate.name]),
      updatedAt: _asDate(row[fertilizerApplications.updatedAt.name]),
      deleted: Value(_asBool(row[fertilizerApplications.deleted.name])),
    );
  }

  MaintenanceRecordsCompanion _maintenanceRecordFromRow(
    Map<String, dynamic> row,
  ) {
    return MaintenanceRecordsCompanion.insert(
      id: _asString(row[maintenanceRecords.id.name]),
      aquariumId: _asString(row[maintenanceRecords.aquariumId.name]),
      maintenanceType: _asString(row[maintenanceRecords.maintenanceType.name]),
      volumeOrAmount: _asDouble(row[maintenanceRecords.volumeOrAmount.name]),
      actionDate: _asDate(row[maintenanceRecords.actionDate.name]),
      updatedAt: _asDate(row[maintenanceRecords.updatedAt.name]),
      deleted: Value(_asBool(row[maintenanceRecords.deleted.name])),
    );
  }

  HydrobiontsCompanion _hydrobiontFromRow(Map<String, dynamic> row) {
    return HydrobiontsCompanion.insert(
      id: _asString(row[hydrobionts.id.name]),
      aquariumId: _asString(row[hydrobionts.aquariumId.name]),
      species: _asString(row[hydrobionts.species.name]),
      quantity: _asInt(row[hydrobionts.quantity.name]),
      action: _asString(row[hydrobionts.action.name]),
      hydrobiontType: _asString(row[hydrobionts.hydrobiontType.name]),
      actionDate: _asDate(row[hydrobionts.actionDate.name]),
      updatedAt: _asDate(row[hydrobionts.updatedAt.name]),
      deleted: Value(_asBool(row[hydrobionts.deleted.name])),
    );
  }

  NotesCompanion _noteFromRow(Map<String, dynamic> row) {
    return NotesCompanion.insert(
      id: _asString(row[notes.id.name]),
      aquariumId: _asString(row[notes.aquariumId.name]),
      content: _asString(row[notes.content.name]),
      noteDate: _asDate(row[notes.noteDate.name]),
      updatedAt: _asDate(row[notes.updatedAt.name]),
      deleted: Value(_asBool(row[notes.deleted.name])),
    );
  }
}

String _asString(dynamic value) {
  if (value == null) return '';
  if (value is String) return value;
  return value.toString();
}

int _asInt(dynamic value) {
  if (value is int) return value;
  if (value is bool) return value ? 1 : 0;
  if (value is num) return value.toInt();

  if (value is String) {
    final asInt = int.tryParse(value);
    if (asInt != null) return asInt;

    final asNum = num.tryParse(value.replaceAll(',', '.'));
    if (asNum != null) return asNum.toInt();
  }

  return 0;
}

double _asDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is bool) return value ? 1.0 : 0.0;
  if (value is num) return value.toDouble();

  if (value is String) {
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    if (parsed != null) return parsed;
  }

  return 0.0;
}

bool _asBool(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;

  if (value is String) {
    final normalized = value.trim().toLowerCase();
    return normalized == '1' ||
        normalized == 'true' ||
        normalized == 'yes' ||
        normalized == 'да';
  }

  return false;
}

DateTime _asDate(dynamic value) {
  if (value == null) return DateTime.now();
  if (value is DateTime) return value;

  if (value is int) {
    final ms = value > 100000000000 ? value : value * 1000;
    return DateTime.fromMillisecondsSinceEpoch(ms);
  }

  if (value is num) {
    final asInt = value.toInt();
    final ms = asInt > 100000000000 ? asInt : asInt * 1000;
    return DateTime.fromMillisecondsSinceEpoch(ms);
  }

  if (value is String) {
    final parsed = DateTime.tryParse(value);
    if (parsed != null) return parsed;

    final asNum = num.tryParse(value.replaceAll(',', '.'));
    if (asNum != null) {
      final asInt = asNum.toInt();
      final ms = asInt > 100000000000 ? asInt : asInt * 1000;
      return DateTime.fromMillisecondsSinceEpoch(ms);
    }
  }

  return DateTime.now();
}

DateTime? _asNullableDate(dynamic value) {
  if (value == null) return null;

  if (value is String && value.trim().isEmpty) return null;

  if (value is int && value == 0) return null;
  if (value is num && value == 0) return null;

  return _asDate(value);
}

int _asUnixSeconds(dynamic value) {
  if (value == null) return 0;

  if (value is DateTime) {
    return value.millisecondsSinceEpoch ~/ 1000;
  }

  if (value is int) {
    return value > 100000000000 ? value ~/ 1000 : value;
  }

  if (value is num) {
    final asInt = value.toInt();
    return asInt > 100000000000 ? asInt ~/ 1000 : asInt;
  }

  if (value is String) {
    final parsed = DateTime.tryParse(value);
    if (parsed != null) {
      return parsed.millisecondsSinceEpoch ~/ 1000;
    }

    final asNum = num.tryParse(value.replaceAll(',', '.'));
    if (asNum != null) {
      final asInt = asNum.toInt();
      return asInt > 100000000000 ? asInt ~/ 1000 : asInt;
    }
  }

  return 0;
}
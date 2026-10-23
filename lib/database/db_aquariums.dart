part of 'app_database.dart';

extension AquariumsRepo on AppDatabase {
  Stream<List<AquariumTileData>> watchTiles() {
    final q = select(aquariums)
      ..where((t) => t.deleted.equals(false))
      ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    return q.watch().asyncMap((rows) async {
      final result = <AquariumTileData>[];

      for (final a in rows) {
        final last = await lastActivity(a.id);
        result.add(AquariumTileData(a, last));
      }

      return result;
    });
  }

  Future<DateTime?> lastActivity(String aquariumId) async {
    DateTime? best;

    void consider(DateTime? d) {
      if (d != null && (best == null || d.isAfter(best!))) best = d;
    }

    final tests = await (select(waterTests)
          ..where((t) =>
              t.aquariumId.equals(aquariumId) & t.deleted.equals(false)))
        .get();
    for (final t in tests) consider(t.updatedAt);

    final maint = await (select(maintenanceRecords)
          ..where((t) =>
              t.aquariumId.equals(aquariumId) & t.deleted.equals(false)))
        .get();
    for (final m in maint) consider(m.updatedAt);

    final fert = await (select(fertilizerApplications)
          ..where((t) =>
              t.aquariumId.equals(aquariumId) & t.deleted.equals(false)))
        .get();
    for (final f in fert) consider(f.updatedAt);

    final hydro = await (select(hydrobionts)
          ..where((t) =>
              t.aquariumId.equals(aquariumId) & t.deleted.equals(false)))
        .get();
    for (final h in hydro) consider(h.updatedAt);

    final notesList = await (select(this.notes)
          ..where((t) =>
              t.aquariumId.equals(aquariumId) & t.deleted.equals(false)))
        .get();
    for (final n in notesList) consider(n.updatedAt);

    return best;
  }

  Future<String> createAquarium({
    required String name,
    required int volume,
    required double l,
    required double w,
    required double h,
    DateTime? launchDate,
  }) async {
    final id = newId();
    final now = DateTime.now();

    await into(aquariums).insert(
      AquariumsCompanion.insert(
        id: id,
        name: name,
        volume: volume,
        lengthCm: l,
        widthCm: w,
        heightCm: h,
        launchDate: Value(launchDate),
        createdAt: now,
        updatedAt: now,
        deleted: const Value(false),
      ),
    );

    return id;
  }

  Future<void> updateAquarium(
    String id, {
    required String name,
    required int volume,
    required double l,
    required double w,
    required double h,
    DateTime? launchDate,
  }) {
    return (update(aquariums)..where((t) => t.id.equals(id))).write(
      AquariumsCompanion(
        name: Value(name),
        volume: Value(volume),
        lengthCm: Value(l),
        widthCm: Value(w),
        heightCm: Value(h),
        launchDate: Value(launchDate),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteAquarium(String id) async {
    final now = DateTime.now();

    await (update(aquariums)..where((t) => t.id.equals(id)))
        .write(AquariumsCompanion(
      deleted: const Value(true),
      updatedAt: Value(now),
    ));

    final lights = await (select(aquariumLights)
          ..where((t) => t.aquariumId.equals(id)))
        .get();
    for (final l in lights) await softDeleteLight(l.id);

    final tests = await (select(waterTests)
          ..where((t) => t.aquariumId.equals(id)))
        .get();
    for (final t in tests) await softDeleteTest(t.id);

    final maint = await (select(maintenanceRecords)
          ..where((t) => t.aquariumId.equals(id)))
        .get();
    for (final m in maint) await softDeleteMaintenance(m.id);

    final fert = await (select(fertilizerApplications)
          ..where((t) => t.aquariumId.equals(id)))
        .get();
    for (final f in fert) await softDeleteFertilizer(f.id);

    final hydro = await (select(hydrobionts)
          ..where((t) => t.aquariumId.equals(id)))
        .get();
    for (final h in hydro) await softDeleteHydrobiont(h.id);

    final notesList = await (select(this.notes)
          ..where((t) => t.aquariumId.equals(id)))
        .get();
    for (final n in notesList) await softDeleteNote(n.id);
  }
}
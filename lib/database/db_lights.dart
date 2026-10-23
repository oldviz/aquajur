part of 'app_database.dart';

extension LightsRepo on AppDatabase {
  Future<void> softDeleteLight(String id) =>
      (update(aquariumLights)..where((t) => t.id.equals(id)))
          .write(AquariumLightsCompanion(
    deleted: const Value(true),
    updatedAt: Value(DateTime.now()),
  ));

  Stream<List<AquariumLight>> watchLights(String aquariumId) =>
      (select(aquariumLights)
            ..where((t) =>
                t.aquariumId.equals(aquariumId) & t.deleted.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.startTime)]))
          .watch();

  Future<List<AquariumLight>> lightsOf(String aquariumId) =>
      (select(aquariumLights)
            ..where((t) =>
                t.aquariumId.equals(aquariumId) & t.deleted.equals(false)))
          .get();

  /// Сохраняет светильник и возвращает его фактический id.
  ///
  /// Это важно для формы аквариума: после сохранения нового светильника
  /// форма должна знать его id, чтобы случайно не удалить его как "старый".
  Future<String> upsertLight(
    String aquariumId,
    String? id,
    String type,
    double power,
    String start,
    String end,
  ) async {
    final now = DateTime.now();
    final lightId = id ?? newId();

    await into(aquariumLights).insert(
      AquariumLightsCompanion.insert(
        id: lightId,
        aquariumId: aquariumId,
        lightType: type,
        powerW: power,
        startTime: start,
        endTime: end,
        updatedAt: now,
        deleted: const Value(false),
      ),
      mode: InsertMode.insertOrReplace,
    );

    return lightId;
  }

  Future<void> removeLight(String id) => softDeleteLight(id);
}
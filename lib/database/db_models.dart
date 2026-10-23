part of 'app_database.dart';

class AquariumTileData {
  final Aquarium aquarium;
  final DateTime? lastActivity;

  const AquariumTileData(this.aquarium, this.lastActivity);
}

class WaterTestWithTypeName {
  final WaterTest test;
  final String typeName;

  const WaterTestWithTypeName(this.test, this.typeName);
}

class FertilizerApplicationWithTypeName {
  final FertilizerApplication application;
  final String typeName;

  const FertilizerApplicationWithTypeName(this.application, this.typeName);
}

class SyncReport {
  final int inserted;
  final int updated;
  final int skipped;

  const SyncReport(this.inserted, this.updated, this.skipped);

  String get summary =>
      'добавлено: $inserted, обновлено: $updated, пропущено: $skipped';
}
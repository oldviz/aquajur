import 'package:drift/drift.dart';

class Aquariums extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get volume => integer()();
  RealColumn get lengthCm => real()();
  RealColumn get widthCm => real()();
  RealColumn get heightCm => real()();
  DateTimeColumn get launchDate => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class AquariumLights extends Table {
  TextColumn get id => text()();
  TextColumn get aquariumId => text().references(Aquariums, #id)();
  TextColumn get lightType => text()();
  RealColumn get powerW => real()();
  TextColumn get startTime => text()();
  TextColumn get endTime => text()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class TestTypes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  BoolColumn get isDefault => boolean()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class WaterTests extends Table {
  TextColumn get id => text()();
  TextColumn get aquariumId => text().references(Aquariums, #id)();
  TextColumn get testTypeId => text().references(TestTypes, #id)();
  TextColumn get value => text()();
  DateTimeColumn get testDate => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class FertilizerTypes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  BoolColumn get isDefault => boolean()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class FertilizerApplications extends Table {
  TextColumn get id => text()();
  TextColumn get aquariumId => text().references(Aquariums, #id)();
  TextColumn get fertilizerTypeId => text().references(FertilizerTypes, #id)();
  RealColumn get dosage => real()();
  RealColumn get totalAmount => real()();
  DateTimeColumn get actionDate => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class MaintenanceRecords extends Table {
  TextColumn get id => text()();
  TextColumn get aquariumId => text().references(Aquariums, #id)();
  TextColumn get maintenanceType => text()();
  RealColumn get volumeOrAmount => real()();
  DateTimeColumn get actionDate => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Hydrobionts extends Table {
  TextColumn get id => text()();
  TextColumn get aquariumId => text().references(Aquariums, #id)();
  TextColumn get species => text()();
  IntColumn get quantity => integer()();
  TextColumn get action => text()();
  TextColumn get hydrobiontType => text()();
  DateTimeColumn get actionDate => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Notes extends Table {
  TextColumn get id => text()();
  TextColumn get aquariumId => text().references(Aquariums, #id)();
  TextColumn get content => text()();
  DateTimeColumn get noteDate => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class SyncMeta extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
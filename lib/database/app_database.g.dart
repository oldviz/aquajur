// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AquariumsTable extends Aquariums
    with TableInfo<$AquariumsTable, Aquarium> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AquariumsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<int> volume = GeneratedColumn<int>(
      'volume', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lengthCmMeta =
      const VerificationMeta('lengthCm');
  @override
  late final GeneratedColumn<double> lengthCm = GeneratedColumn<double>(
      'length_cm', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _widthCmMeta =
      const VerificationMeta('widthCm');
  @override
  late final GeneratedColumn<double> widthCm = GeneratedColumn<double>(
      'width_cm', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _heightCmMeta =
      const VerificationMeta('heightCm');
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
      'height_cm', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _launchDateMeta =
      const VerificationMeta('launchDate');
  @override
  late final GeneratedColumn<DateTime> launchDate = GeneratedColumn<DateTime>(
      'launch_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        volume,
        lengthCm,
        widthCm,
        heightCm,
        launchDate,
        createdAt,
        updatedAt,
        deleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'aquariums';
  @override
  VerificationContext validateIntegrity(Insertable<Aquarium> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta));
    } else if (isInserting) {
      context.missing(_volumeMeta);
    }
    if (data.containsKey('length_cm')) {
      context.handle(_lengthCmMeta,
          lengthCm.isAcceptableOrUnknown(data['length_cm']!, _lengthCmMeta));
    } else if (isInserting) {
      context.missing(_lengthCmMeta);
    }
    if (data.containsKey('width_cm')) {
      context.handle(_widthCmMeta,
          widthCm.isAcceptableOrUnknown(data['width_cm']!, _widthCmMeta));
    } else if (isInserting) {
      context.missing(_widthCmMeta);
    }
    if (data.containsKey('height_cm')) {
      context.handle(_heightCmMeta,
          heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta));
    } else if (isInserting) {
      context.missing(_heightCmMeta);
    }
    if (data.containsKey('launch_date')) {
      context.handle(
          _launchDateMeta,
          launchDate.isAcceptableOrUnknown(
              data['launch_date']!, _launchDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Aquarium map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Aquarium(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      volume: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}volume'])!,
      lengthCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}length_cm'])!,
      widthCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}width_cm'])!,
      heightCm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height_cm'])!,
      launchDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}launch_date']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $AquariumsTable createAlias(String alias) {
    return $AquariumsTable(attachedDatabase, alias);
  }
}

class Aquarium extends DataClass implements Insertable<Aquarium> {
  final String id;
  final String name;
  final int volume;
  final double lengthCm;
  final double widthCm;
  final double heightCm;
  final DateTime? launchDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  const Aquarium(
      {required this.id,
      required this.name,
      required this.volume,
      required this.lengthCm,
      required this.widthCm,
      required this.heightCm,
      this.launchDate,
      required this.createdAt,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['volume'] = Variable<int>(volume);
    map['length_cm'] = Variable<double>(lengthCm);
    map['width_cm'] = Variable<double>(widthCm);
    map['height_cm'] = Variable<double>(heightCm);
    if (!nullToAbsent || launchDate != null) {
      map['launch_date'] = Variable<DateTime>(launchDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  AquariumsCompanion toCompanion(bool nullToAbsent) {
    return AquariumsCompanion(
      id: Value(id),
      name: Value(name),
      volume: Value(volume),
      lengthCm: Value(lengthCm),
      widthCm: Value(widthCm),
      heightCm: Value(heightCm),
      launchDate: launchDate == null && nullToAbsent
          ? const Value.absent()
          : Value(launchDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory Aquarium.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Aquarium(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      volume: serializer.fromJson<int>(json['volume']),
      lengthCm: serializer.fromJson<double>(json['lengthCm']),
      widthCm: serializer.fromJson<double>(json['widthCm']),
      heightCm: serializer.fromJson<double>(json['heightCm']),
      launchDate: serializer.fromJson<DateTime?>(json['launchDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'volume': serializer.toJson<int>(volume),
      'lengthCm': serializer.toJson<double>(lengthCm),
      'widthCm': serializer.toJson<double>(widthCm),
      'heightCm': serializer.toJson<double>(heightCm),
      'launchDate': serializer.toJson<DateTime?>(launchDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  Aquarium copyWith(
          {String? id,
          String? name,
          int? volume,
          double? lengthCm,
          double? widthCm,
          double? heightCm,
          Value<DateTime?> launchDate = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          bool? deleted}) =>
      Aquarium(
        id: id ?? this.id,
        name: name ?? this.name,
        volume: volume ?? this.volume,
        lengthCm: lengthCm ?? this.lengthCm,
        widthCm: widthCm ?? this.widthCm,
        heightCm: heightCm ?? this.heightCm,
        launchDate: launchDate.present ? launchDate.value : this.launchDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  Aquarium copyWithCompanion(AquariumsCompanion data) {
    return Aquarium(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      volume: data.volume.present ? data.volume.value : this.volume,
      lengthCm: data.lengthCm.present ? data.lengthCm.value : this.lengthCm,
      widthCm: data.widthCm.present ? data.widthCm.value : this.widthCm,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
      launchDate:
          data.launchDate.present ? data.launchDate.value : this.launchDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Aquarium(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('volume: $volume, ')
          ..write('lengthCm: $lengthCm, ')
          ..write('widthCm: $widthCm, ')
          ..write('heightCm: $heightCm, ')
          ..write('launchDate: $launchDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, volume, lengthCm, widthCm, heightCm,
      launchDate, createdAt, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Aquarium &&
          other.id == this.id &&
          other.name == this.name &&
          other.volume == this.volume &&
          other.lengthCm == this.lengthCm &&
          other.widthCm == this.widthCm &&
          other.heightCm == this.heightCm &&
          other.launchDate == this.launchDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class AquariumsCompanion extends UpdateCompanion<Aquarium> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> volume;
  final Value<double> lengthCm;
  final Value<double> widthCm;
  final Value<double> heightCm;
  final Value<DateTime?> launchDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const AquariumsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.volume = const Value.absent(),
    this.lengthCm = const Value.absent(),
    this.widthCm = const Value.absent(),
    this.heightCm = const Value.absent(),
    this.launchDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AquariumsCompanion.insert({
    required String id,
    required String name,
    required int volume,
    required double lengthCm,
    required double widthCm,
    required double heightCm,
    this.launchDate = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        volume = Value(volume),
        lengthCm = Value(lengthCm),
        widthCm = Value(widthCm),
        heightCm = Value(heightCm),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Aquarium> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? volume,
    Expression<double>? lengthCm,
    Expression<double>? widthCm,
    Expression<double>? heightCm,
    Expression<DateTime>? launchDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (volume != null) 'volume': volume,
      if (lengthCm != null) 'length_cm': lengthCm,
      if (widthCm != null) 'width_cm': widthCm,
      if (heightCm != null) 'height_cm': heightCm,
      if (launchDate != null) 'launch_date': launchDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AquariumsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? volume,
      Value<double>? lengthCm,
      Value<double>? widthCm,
      Value<double>? heightCm,
      Value<DateTime?>? launchDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return AquariumsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      volume: volume ?? this.volume,
      lengthCm: lengthCm ?? this.lengthCm,
      widthCm: widthCm ?? this.widthCm,
      heightCm: heightCm ?? this.heightCm,
      launchDate: launchDate ?? this.launchDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (volume.present) {
      map['volume'] = Variable<int>(volume.value);
    }
    if (lengthCm.present) {
      map['length_cm'] = Variable<double>(lengthCm.value);
    }
    if (widthCm.present) {
      map['width_cm'] = Variable<double>(widthCm.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
    }
    if (launchDate.present) {
      map['launch_date'] = Variable<DateTime>(launchDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AquariumsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('volume: $volume, ')
          ..write('lengthCm: $lengthCm, ')
          ..write('widthCm: $widthCm, ')
          ..write('heightCm: $heightCm, ')
          ..write('launchDate: $launchDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AquariumLightsTable extends AquariumLights
    with TableInfo<$AquariumLightsTable, AquariumLight> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AquariumLightsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aquariumIdMeta =
      const VerificationMeta('aquariumId');
  @override
  late final GeneratedColumn<String> aquariumId = GeneratedColumn<String>(
      'aquarium_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES aquariums (id)'));
  static const VerificationMeta _lightTypeMeta =
      const VerificationMeta('lightType');
  @override
  late final GeneratedColumn<String> lightType = GeneratedColumn<String>(
      'light_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _powerWMeta = const VerificationMeta('powerW');
  @override
  late final GeneratedColumn<double> powerW = GeneratedColumn<double>(
      'power_w', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'start_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'end_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        aquariumId,
        lightType,
        powerW,
        startTime,
        endTime,
        updatedAt,
        deleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'aquarium_lights';
  @override
  VerificationContext validateIntegrity(Insertable<AquariumLight> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('aquarium_id')) {
      context.handle(
          _aquariumIdMeta,
          aquariumId.isAcceptableOrUnknown(
              data['aquarium_id']!, _aquariumIdMeta));
    } else if (isInserting) {
      context.missing(_aquariumIdMeta);
    }
    if (data.containsKey('light_type')) {
      context.handle(_lightTypeMeta,
          lightType.isAcceptableOrUnknown(data['light_type']!, _lightTypeMeta));
    } else if (isInserting) {
      context.missing(_lightTypeMeta);
    }
    if (data.containsKey('power_w')) {
      context.handle(_powerWMeta,
          powerW.isAcceptableOrUnknown(data['power_w']!, _powerWMeta));
    } else if (isInserting) {
      context.missing(_powerWMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AquariumLight map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AquariumLight(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      aquariumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aquarium_id'])!,
      lightType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}light_type'])!,
      powerW: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}power_w'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_time'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $AquariumLightsTable createAlias(String alias) {
    return $AquariumLightsTable(attachedDatabase, alias);
  }
}

class AquariumLight extends DataClass implements Insertable<AquariumLight> {
  final String id;
  final String aquariumId;
  final String lightType;
  final double powerW;
  final String startTime;
  final String endTime;
  final DateTime updatedAt;
  final bool deleted;
  const AquariumLight(
      {required this.id,
      required this.aquariumId,
      required this.lightType,
      required this.powerW,
      required this.startTime,
      required this.endTime,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['aquarium_id'] = Variable<String>(aquariumId);
    map['light_type'] = Variable<String>(lightType);
    map['power_w'] = Variable<double>(powerW);
    map['start_time'] = Variable<String>(startTime);
    map['end_time'] = Variable<String>(endTime);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  AquariumLightsCompanion toCompanion(bool nullToAbsent) {
    return AquariumLightsCompanion(
      id: Value(id),
      aquariumId: Value(aquariumId),
      lightType: Value(lightType),
      powerW: Value(powerW),
      startTime: Value(startTime),
      endTime: Value(endTime),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory AquariumLight.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AquariumLight(
      id: serializer.fromJson<String>(json['id']),
      aquariumId: serializer.fromJson<String>(json['aquariumId']),
      lightType: serializer.fromJson<String>(json['lightType']),
      powerW: serializer.fromJson<double>(json['powerW']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'aquariumId': serializer.toJson<String>(aquariumId),
      'lightType': serializer.toJson<String>(lightType),
      'powerW': serializer.toJson<double>(powerW),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  AquariumLight copyWith(
          {String? id,
          String? aquariumId,
          String? lightType,
          double? powerW,
          String? startTime,
          String? endTime,
          DateTime? updatedAt,
          bool? deleted}) =>
      AquariumLight(
        id: id ?? this.id,
        aquariumId: aquariumId ?? this.aquariumId,
        lightType: lightType ?? this.lightType,
        powerW: powerW ?? this.powerW,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  AquariumLight copyWithCompanion(AquariumLightsCompanion data) {
    return AquariumLight(
      id: data.id.present ? data.id.value : this.id,
      aquariumId:
          data.aquariumId.present ? data.aquariumId.value : this.aquariumId,
      lightType: data.lightType.present ? data.lightType.value : this.lightType,
      powerW: data.powerW.present ? data.powerW.value : this.powerW,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AquariumLight(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('lightType: $lightType, ')
          ..write('powerW: $powerW, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, aquariumId, lightType, powerW, startTime,
      endTime, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AquariumLight &&
          other.id == this.id &&
          other.aquariumId == this.aquariumId &&
          other.lightType == this.lightType &&
          other.powerW == this.powerW &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class AquariumLightsCompanion extends UpdateCompanion<AquariumLight> {
  final Value<String> id;
  final Value<String> aquariumId;
  final Value<String> lightType;
  final Value<double> powerW;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const AquariumLightsCompanion({
    this.id = const Value.absent(),
    this.aquariumId = const Value.absent(),
    this.lightType = const Value.absent(),
    this.powerW = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AquariumLightsCompanion.insert({
    required String id,
    required String aquariumId,
    required String lightType,
    required double powerW,
    required String startTime,
    required String endTime,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        aquariumId = Value(aquariumId),
        lightType = Value(lightType),
        powerW = Value(powerW),
        startTime = Value(startTime),
        endTime = Value(endTime),
        updatedAt = Value(updatedAt);
  static Insertable<AquariumLight> custom({
    Expression<String>? id,
    Expression<String>? aquariumId,
    Expression<String>? lightType,
    Expression<double>? powerW,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aquariumId != null) 'aquarium_id': aquariumId,
      if (lightType != null) 'light_type': lightType,
      if (powerW != null) 'power_w': powerW,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AquariumLightsCompanion copyWith(
      {Value<String>? id,
      Value<String>? aquariumId,
      Value<String>? lightType,
      Value<double>? powerW,
      Value<String>? startTime,
      Value<String>? endTime,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return AquariumLightsCompanion(
      id: id ?? this.id,
      aquariumId: aquariumId ?? this.aquariumId,
      lightType: lightType ?? this.lightType,
      powerW: powerW ?? this.powerW,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (aquariumId.present) {
      map['aquarium_id'] = Variable<String>(aquariumId.value);
    }
    if (lightType.present) {
      map['light_type'] = Variable<String>(lightType.value);
    }
    if (powerW.present) {
      map['power_w'] = Variable<double>(powerW.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AquariumLightsCompanion(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('lightType: $lightType, ')
          ..write('powerW: $powerW, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TestTypesTable extends TestTypes
    with TableInfo<$TestTypesTable, TestType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TestTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, isDefault, updatedAt, deleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'test_types';
  @override
  VerificationContext validateIntegrity(Insertable<TestType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    } else if (isInserting) {
      context.missing(_isDefaultMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TestType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TestType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $TestTypesTable createAlias(String alias) {
    return $TestTypesTable(attachedDatabase, alias);
  }
}

class TestType extends DataClass implements Insertable<TestType> {
  final String id;
  final String name;
  final bool isDefault;
  final DateTime updatedAt;
  final bool deleted;
  const TestType(
      {required this.id,
      required this.name,
      required this.isDefault,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['is_default'] = Variable<bool>(isDefault);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  TestTypesCompanion toCompanion(bool nullToAbsent) {
    return TestTypesCompanion(
      id: Value(id),
      name: Value(name),
      isDefault: Value(isDefault),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory TestType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TestType(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'isDefault': serializer.toJson<bool>(isDefault),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  TestType copyWith(
          {String? id,
          String? name,
          bool? isDefault,
          DateTime? updatedAt,
          bool? deleted}) =>
      TestType(
        id: id ?? this.id,
        name: name ?? this.name,
        isDefault: isDefault ?? this.isDefault,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  TestType copyWithCompanion(TestTypesCompanion data) {
    return TestType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TestType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDefault: $isDefault, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isDefault, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TestType &&
          other.id == this.id &&
          other.name == this.name &&
          other.isDefault == this.isDefault &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class TestTypesCompanion extends UpdateCompanion<TestType> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> isDefault;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const TestTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TestTypesCompanion.insert({
    required String id,
    required String name,
    required bool isDefault,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        isDefault = Value(isDefault),
        updatedAt = Value(updatedAt);
  static Insertable<TestType> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? isDefault,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isDefault != null) 'is_default': isDefault,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TestTypesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<bool>? isDefault,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return TestTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isDefault: isDefault ?? this.isDefault,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TestTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDefault: $isDefault, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WaterTestsTable extends WaterTests
    with TableInfo<$WaterTestsTable, WaterTest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WaterTestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aquariumIdMeta =
      const VerificationMeta('aquariumId');
  @override
  late final GeneratedColumn<String> aquariumId = GeneratedColumn<String>(
      'aquarium_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES aquariums (id)'));
  static const VerificationMeta _testTypeIdMeta =
      const VerificationMeta('testTypeId');
  @override
  late final GeneratedColumn<String> testTypeId = GeneratedColumn<String>(
      'test_type_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES test_types (id)'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _testDateMeta =
      const VerificationMeta('testDate');
  @override
  late final GeneratedColumn<DateTime> testDate = GeneratedColumn<DateTime>(
      'test_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, aquariumId, testTypeId, value, testDate, updatedAt, deleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'water_tests';
  @override
  VerificationContext validateIntegrity(Insertable<WaterTest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('aquarium_id')) {
      context.handle(
          _aquariumIdMeta,
          aquariumId.isAcceptableOrUnknown(
              data['aquarium_id']!, _aquariumIdMeta));
    } else if (isInserting) {
      context.missing(_aquariumIdMeta);
    }
    if (data.containsKey('test_type_id')) {
      context.handle(
          _testTypeIdMeta,
          testTypeId.isAcceptableOrUnknown(
              data['test_type_id']!, _testTypeIdMeta));
    } else if (isInserting) {
      context.missing(_testTypeIdMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('test_date')) {
      context.handle(_testDateMeta,
          testDate.isAcceptableOrUnknown(data['test_date']!, _testDateMeta));
    } else if (isInserting) {
      context.missing(_testDateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WaterTest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WaterTest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      aquariumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aquarium_id'])!,
      testTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}test_type_id'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      testDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}test_date'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $WaterTestsTable createAlias(String alias) {
    return $WaterTestsTable(attachedDatabase, alias);
  }
}

class WaterTest extends DataClass implements Insertable<WaterTest> {
  final String id;
  final String aquariumId;
  final String testTypeId;
  final String value;
  final DateTime testDate;
  final DateTime updatedAt;
  final bool deleted;
  const WaterTest(
      {required this.id,
      required this.aquariumId,
      required this.testTypeId,
      required this.value,
      required this.testDate,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['aquarium_id'] = Variable<String>(aquariumId);
    map['test_type_id'] = Variable<String>(testTypeId);
    map['value'] = Variable<String>(value);
    map['test_date'] = Variable<DateTime>(testDate);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  WaterTestsCompanion toCompanion(bool nullToAbsent) {
    return WaterTestsCompanion(
      id: Value(id),
      aquariumId: Value(aquariumId),
      testTypeId: Value(testTypeId),
      value: Value(value),
      testDate: Value(testDate),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory WaterTest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WaterTest(
      id: serializer.fromJson<String>(json['id']),
      aquariumId: serializer.fromJson<String>(json['aquariumId']),
      testTypeId: serializer.fromJson<String>(json['testTypeId']),
      value: serializer.fromJson<String>(json['value']),
      testDate: serializer.fromJson<DateTime>(json['testDate']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'aquariumId': serializer.toJson<String>(aquariumId),
      'testTypeId': serializer.toJson<String>(testTypeId),
      'value': serializer.toJson<String>(value),
      'testDate': serializer.toJson<DateTime>(testDate),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  WaterTest copyWith(
          {String? id,
          String? aquariumId,
          String? testTypeId,
          String? value,
          DateTime? testDate,
          DateTime? updatedAt,
          bool? deleted}) =>
      WaterTest(
        id: id ?? this.id,
        aquariumId: aquariumId ?? this.aquariumId,
        testTypeId: testTypeId ?? this.testTypeId,
        value: value ?? this.value,
        testDate: testDate ?? this.testDate,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  WaterTest copyWithCompanion(WaterTestsCompanion data) {
    return WaterTest(
      id: data.id.present ? data.id.value : this.id,
      aquariumId:
          data.aquariumId.present ? data.aquariumId.value : this.aquariumId,
      testTypeId:
          data.testTypeId.present ? data.testTypeId.value : this.testTypeId,
      value: data.value.present ? data.value.value : this.value,
      testDate: data.testDate.present ? data.testDate.value : this.testDate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WaterTest(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('testTypeId: $testTypeId, ')
          ..write('value: $value, ')
          ..write('testDate: $testDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, aquariumId, testTypeId, value, testDate, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WaterTest &&
          other.id == this.id &&
          other.aquariumId == this.aquariumId &&
          other.testTypeId == this.testTypeId &&
          other.value == this.value &&
          other.testDate == this.testDate &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class WaterTestsCompanion extends UpdateCompanion<WaterTest> {
  final Value<String> id;
  final Value<String> aquariumId;
  final Value<String> testTypeId;
  final Value<String> value;
  final Value<DateTime> testDate;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const WaterTestsCompanion({
    this.id = const Value.absent(),
    this.aquariumId = const Value.absent(),
    this.testTypeId = const Value.absent(),
    this.value = const Value.absent(),
    this.testDate = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WaterTestsCompanion.insert({
    required String id,
    required String aquariumId,
    required String testTypeId,
    required String value,
    required DateTime testDate,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        aquariumId = Value(aquariumId),
        testTypeId = Value(testTypeId),
        value = Value(value),
        testDate = Value(testDate),
        updatedAt = Value(updatedAt);
  static Insertable<WaterTest> custom({
    Expression<String>? id,
    Expression<String>? aquariumId,
    Expression<String>? testTypeId,
    Expression<String>? value,
    Expression<DateTime>? testDate,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aquariumId != null) 'aquarium_id': aquariumId,
      if (testTypeId != null) 'test_type_id': testTypeId,
      if (value != null) 'value': value,
      if (testDate != null) 'test_date': testDate,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WaterTestsCompanion copyWith(
      {Value<String>? id,
      Value<String>? aquariumId,
      Value<String>? testTypeId,
      Value<String>? value,
      Value<DateTime>? testDate,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return WaterTestsCompanion(
      id: id ?? this.id,
      aquariumId: aquariumId ?? this.aquariumId,
      testTypeId: testTypeId ?? this.testTypeId,
      value: value ?? this.value,
      testDate: testDate ?? this.testDate,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (aquariumId.present) {
      map['aquarium_id'] = Variable<String>(aquariumId.value);
    }
    if (testTypeId.present) {
      map['test_type_id'] = Variable<String>(testTypeId.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (testDate.present) {
      map['test_date'] = Variable<DateTime>(testDate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WaterTestsCompanion(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('testTypeId: $testTypeId, ')
          ..write('value: $value, ')
          ..write('testDate: $testDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FertilizerTypesTable extends FertilizerTypes
    with TableInfo<$FertilizerTypesTable, FertilizerType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FertilizerTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, isDefault, updatedAt, deleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fertilizer_types';
  @override
  VerificationContext validateIntegrity(Insertable<FertilizerType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    } else if (isInserting) {
      context.missing(_isDefaultMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FertilizerType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FertilizerType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $FertilizerTypesTable createAlias(String alias) {
    return $FertilizerTypesTable(attachedDatabase, alias);
  }
}

class FertilizerType extends DataClass implements Insertable<FertilizerType> {
  final String id;
  final String name;
  final bool isDefault;
  final DateTime updatedAt;
  final bool deleted;
  const FertilizerType(
      {required this.id,
      required this.name,
      required this.isDefault,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['is_default'] = Variable<bool>(isDefault);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  FertilizerTypesCompanion toCompanion(bool nullToAbsent) {
    return FertilizerTypesCompanion(
      id: Value(id),
      name: Value(name),
      isDefault: Value(isDefault),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory FertilizerType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FertilizerType(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'isDefault': serializer.toJson<bool>(isDefault),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  FertilizerType copyWith(
          {String? id,
          String? name,
          bool? isDefault,
          DateTime? updatedAt,
          bool? deleted}) =>
      FertilizerType(
        id: id ?? this.id,
        name: name ?? this.name,
        isDefault: isDefault ?? this.isDefault,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  FertilizerType copyWithCompanion(FertilizerTypesCompanion data) {
    return FertilizerType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FertilizerType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDefault: $isDefault, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, isDefault, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FertilizerType &&
          other.id == this.id &&
          other.name == this.name &&
          other.isDefault == this.isDefault &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class FertilizerTypesCompanion extends UpdateCompanion<FertilizerType> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> isDefault;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const FertilizerTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FertilizerTypesCompanion.insert({
    required String id,
    required String name,
    required bool isDefault,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        isDefault = Value(isDefault),
        updatedAt = Value(updatedAt);
  static Insertable<FertilizerType> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? isDefault,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isDefault != null) 'is_default': isDefault,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FertilizerTypesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<bool>? isDefault,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return FertilizerTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isDefault: isDefault ?? this.isDefault,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FertilizerTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDefault: $isDefault, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FertilizerApplicationsTable extends FertilizerApplications
    with TableInfo<$FertilizerApplicationsTable, FertilizerApplication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FertilizerApplicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aquariumIdMeta =
      const VerificationMeta('aquariumId');
  @override
  late final GeneratedColumn<String> aquariumId = GeneratedColumn<String>(
      'aquarium_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES aquariums (id)'));
  static const VerificationMeta _fertilizerTypeIdMeta =
      const VerificationMeta('fertilizerTypeId');
  @override
  late final GeneratedColumn<String> fertilizerTypeId = GeneratedColumn<String>(
      'fertilizer_type_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES fertilizer_types (id)'));
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<double> dosage = GeneratedColumn<double>(
      'dosage', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _actionDateMeta =
      const VerificationMeta('actionDate');
  @override
  late final GeneratedColumn<DateTime> actionDate = GeneratedColumn<DateTime>(
      'action_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        aquariumId,
        fertilizerTypeId,
        dosage,
        totalAmount,
        actionDate,
        updatedAt,
        deleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fertilizer_applications';
  @override
  VerificationContext validateIntegrity(
      Insertable<FertilizerApplication> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('aquarium_id')) {
      context.handle(
          _aquariumIdMeta,
          aquariumId.isAcceptableOrUnknown(
              data['aquarium_id']!, _aquariumIdMeta));
    } else if (isInserting) {
      context.missing(_aquariumIdMeta);
    }
    if (data.containsKey('fertilizer_type_id')) {
      context.handle(
          _fertilizerTypeIdMeta,
          fertilizerTypeId.isAcceptableOrUnknown(
              data['fertilizer_type_id']!, _fertilizerTypeIdMeta));
    } else if (isInserting) {
      context.missing(_fertilizerTypeIdMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(_dosageMeta,
          dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta));
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('action_date')) {
      context.handle(
          _actionDateMeta,
          actionDate.isAcceptableOrUnknown(
              data['action_date']!, _actionDateMeta));
    } else if (isInserting) {
      context.missing(_actionDateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FertilizerApplication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FertilizerApplication(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      aquariumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aquarium_id'])!,
      fertilizerTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}fertilizer_type_id'])!,
      dosage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}dosage'])!,
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      actionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}action_date'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $FertilizerApplicationsTable createAlias(String alias) {
    return $FertilizerApplicationsTable(attachedDatabase, alias);
  }
}

class FertilizerApplication extends DataClass
    implements Insertable<FertilizerApplication> {
  final String id;
  final String aquariumId;
  final String fertilizerTypeId;
  final double dosage;
  final double totalAmount;
  final DateTime actionDate;
  final DateTime updatedAt;
  final bool deleted;
  const FertilizerApplication(
      {required this.id,
      required this.aquariumId,
      required this.fertilizerTypeId,
      required this.dosage,
      required this.totalAmount,
      required this.actionDate,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['aquarium_id'] = Variable<String>(aquariumId);
    map['fertilizer_type_id'] = Variable<String>(fertilizerTypeId);
    map['dosage'] = Variable<double>(dosage);
    map['total_amount'] = Variable<double>(totalAmount);
    map['action_date'] = Variable<DateTime>(actionDate);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  FertilizerApplicationsCompanion toCompanion(bool nullToAbsent) {
    return FertilizerApplicationsCompanion(
      id: Value(id),
      aquariumId: Value(aquariumId),
      fertilizerTypeId: Value(fertilizerTypeId),
      dosage: Value(dosage),
      totalAmount: Value(totalAmount),
      actionDate: Value(actionDate),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory FertilizerApplication.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FertilizerApplication(
      id: serializer.fromJson<String>(json['id']),
      aquariumId: serializer.fromJson<String>(json['aquariumId']),
      fertilizerTypeId: serializer.fromJson<String>(json['fertilizerTypeId']),
      dosage: serializer.fromJson<double>(json['dosage']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      actionDate: serializer.fromJson<DateTime>(json['actionDate']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'aquariumId': serializer.toJson<String>(aquariumId),
      'fertilizerTypeId': serializer.toJson<String>(fertilizerTypeId),
      'dosage': serializer.toJson<double>(dosage),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'actionDate': serializer.toJson<DateTime>(actionDate),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  FertilizerApplication copyWith(
          {String? id,
          String? aquariumId,
          String? fertilizerTypeId,
          double? dosage,
          double? totalAmount,
          DateTime? actionDate,
          DateTime? updatedAt,
          bool? deleted}) =>
      FertilizerApplication(
        id: id ?? this.id,
        aquariumId: aquariumId ?? this.aquariumId,
        fertilizerTypeId: fertilizerTypeId ?? this.fertilizerTypeId,
        dosage: dosage ?? this.dosage,
        totalAmount: totalAmount ?? this.totalAmount,
        actionDate: actionDate ?? this.actionDate,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  FertilizerApplication copyWithCompanion(
      FertilizerApplicationsCompanion data) {
    return FertilizerApplication(
      id: data.id.present ? data.id.value : this.id,
      aquariumId:
          data.aquariumId.present ? data.aquariumId.value : this.aquariumId,
      fertilizerTypeId: data.fertilizerTypeId.present
          ? data.fertilizerTypeId.value
          : this.fertilizerTypeId,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      actionDate:
          data.actionDate.present ? data.actionDate.value : this.actionDate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FertilizerApplication(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('fertilizerTypeId: $fertilizerTypeId, ')
          ..write('dosage: $dosage, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('actionDate: $actionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, aquariumId, fertilizerTypeId, dosage,
      totalAmount, actionDate, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FertilizerApplication &&
          other.id == this.id &&
          other.aquariumId == this.aquariumId &&
          other.fertilizerTypeId == this.fertilizerTypeId &&
          other.dosage == this.dosage &&
          other.totalAmount == this.totalAmount &&
          other.actionDate == this.actionDate &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class FertilizerApplicationsCompanion
    extends UpdateCompanion<FertilizerApplication> {
  final Value<String> id;
  final Value<String> aquariumId;
  final Value<String> fertilizerTypeId;
  final Value<double> dosage;
  final Value<double> totalAmount;
  final Value<DateTime> actionDate;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const FertilizerApplicationsCompanion({
    this.id = const Value.absent(),
    this.aquariumId = const Value.absent(),
    this.fertilizerTypeId = const Value.absent(),
    this.dosage = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.actionDate = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FertilizerApplicationsCompanion.insert({
    required String id,
    required String aquariumId,
    required String fertilizerTypeId,
    required double dosage,
    required double totalAmount,
    required DateTime actionDate,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        aquariumId = Value(aquariumId),
        fertilizerTypeId = Value(fertilizerTypeId),
        dosage = Value(dosage),
        totalAmount = Value(totalAmount),
        actionDate = Value(actionDate),
        updatedAt = Value(updatedAt);
  static Insertable<FertilizerApplication> custom({
    Expression<String>? id,
    Expression<String>? aquariumId,
    Expression<String>? fertilizerTypeId,
    Expression<double>? dosage,
    Expression<double>? totalAmount,
    Expression<DateTime>? actionDate,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aquariumId != null) 'aquarium_id': aquariumId,
      if (fertilizerTypeId != null) 'fertilizer_type_id': fertilizerTypeId,
      if (dosage != null) 'dosage': dosage,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (actionDate != null) 'action_date': actionDate,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FertilizerApplicationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? aquariumId,
      Value<String>? fertilizerTypeId,
      Value<double>? dosage,
      Value<double>? totalAmount,
      Value<DateTime>? actionDate,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return FertilizerApplicationsCompanion(
      id: id ?? this.id,
      aquariumId: aquariumId ?? this.aquariumId,
      fertilizerTypeId: fertilizerTypeId ?? this.fertilizerTypeId,
      dosage: dosage ?? this.dosage,
      totalAmount: totalAmount ?? this.totalAmount,
      actionDate: actionDate ?? this.actionDate,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (aquariumId.present) {
      map['aquarium_id'] = Variable<String>(aquariumId.value);
    }
    if (fertilizerTypeId.present) {
      map['fertilizer_type_id'] = Variable<String>(fertilizerTypeId.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<double>(dosage.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (actionDate.present) {
      map['action_date'] = Variable<DateTime>(actionDate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FertilizerApplicationsCompanion(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('fertilizerTypeId: $fertilizerTypeId, ')
          ..write('dosage: $dosage, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('actionDate: $actionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MaintenanceRecordsTable extends MaintenanceRecords
    with TableInfo<$MaintenanceRecordsTable, MaintenanceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaintenanceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aquariumIdMeta =
      const VerificationMeta('aquariumId');
  @override
  late final GeneratedColumn<String> aquariumId = GeneratedColumn<String>(
      'aquarium_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES aquariums (id)'));
  static const VerificationMeta _maintenanceTypeMeta =
      const VerificationMeta('maintenanceType');
  @override
  late final GeneratedColumn<String> maintenanceType = GeneratedColumn<String>(
      'maintenance_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _volumeOrAmountMeta =
      const VerificationMeta('volumeOrAmount');
  @override
  late final GeneratedColumn<double> volumeOrAmount = GeneratedColumn<double>(
      'volume_or_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _actionDateMeta =
      const VerificationMeta('actionDate');
  @override
  late final GeneratedColumn<DateTime> actionDate = GeneratedColumn<DateTime>(
      'action_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        aquariumId,
        maintenanceType,
        volumeOrAmount,
        actionDate,
        updatedAt,
        deleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'maintenance_records';
  @override
  VerificationContext validateIntegrity(Insertable<MaintenanceRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('aquarium_id')) {
      context.handle(
          _aquariumIdMeta,
          aquariumId.isAcceptableOrUnknown(
              data['aquarium_id']!, _aquariumIdMeta));
    } else if (isInserting) {
      context.missing(_aquariumIdMeta);
    }
    if (data.containsKey('maintenance_type')) {
      context.handle(
          _maintenanceTypeMeta,
          maintenanceType.isAcceptableOrUnknown(
              data['maintenance_type']!, _maintenanceTypeMeta));
    } else if (isInserting) {
      context.missing(_maintenanceTypeMeta);
    }
    if (data.containsKey('volume_or_amount')) {
      context.handle(
          _volumeOrAmountMeta,
          volumeOrAmount.isAcceptableOrUnknown(
              data['volume_or_amount']!, _volumeOrAmountMeta));
    } else if (isInserting) {
      context.missing(_volumeOrAmountMeta);
    }
    if (data.containsKey('action_date')) {
      context.handle(
          _actionDateMeta,
          actionDate.isAcceptableOrUnknown(
              data['action_date']!, _actionDateMeta));
    } else if (isInserting) {
      context.missing(_actionDateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaintenanceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaintenanceRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      aquariumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aquarium_id'])!,
      maintenanceType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}maintenance_type'])!,
      volumeOrAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}volume_or_amount'])!,
      actionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}action_date'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $MaintenanceRecordsTable createAlias(String alias) {
    return $MaintenanceRecordsTable(attachedDatabase, alias);
  }
}

class MaintenanceRecord extends DataClass
    implements Insertable<MaintenanceRecord> {
  final String id;
  final String aquariumId;
  final String maintenanceType;
  final double volumeOrAmount;
  final DateTime actionDate;
  final DateTime updatedAt;
  final bool deleted;
  const MaintenanceRecord(
      {required this.id,
      required this.aquariumId,
      required this.maintenanceType,
      required this.volumeOrAmount,
      required this.actionDate,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['aquarium_id'] = Variable<String>(aquariumId);
    map['maintenance_type'] = Variable<String>(maintenanceType);
    map['volume_or_amount'] = Variable<double>(volumeOrAmount);
    map['action_date'] = Variable<DateTime>(actionDate);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  MaintenanceRecordsCompanion toCompanion(bool nullToAbsent) {
    return MaintenanceRecordsCompanion(
      id: Value(id),
      aquariumId: Value(aquariumId),
      maintenanceType: Value(maintenanceType),
      volumeOrAmount: Value(volumeOrAmount),
      actionDate: Value(actionDate),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaintenanceRecord(
      id: serializer.fromJson<String>(json['id']),
      aquariumId: serializer.fromJson<String>(json['aquariumId']),
      maintenanceType: serializer.fromJson<String>(json['maintenanceType']),
      volumeOrAmount: serializer.fromJson<double>(json['volumeOrAmount']),
      actionDate: serializer.fromJson<DateTime>(json['actionDate']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'aquariumId': serializer.toJson<String>(aquariumId),
      'maintenanceType': serializer.toJson<String>(maintenanceType),
      'volumeOrAmount': serializer.toJson<double>(volumeOrAmount),
      'actionDate': serializer.toJson<DateTime>(actionDate),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  MaintenanceRecord copyWith(
          {String? id,
          String? aquariumId,
          String? maintenanceType,
          double? volumeOrAmount,
          DateTime? actionDate,
          DateTime? updatedAt,
          bool? deleted}) =>
      MaintenanceRecord(
        id: id ?? this.id,
        aquariumId: aquariumId ?? this.aquariumId,
        maintenanceType: maintenanceType ?? this.maintenanceType,
        volumeOrAmount: volumeOrAmount ?? this.volumeOrAmount,
        actionDate: actionDate ?? this.actionDate,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  MaintenanceRecord copyWithCompanion(MaintenanceRecordsCompanion data) {
    return MaintenanceRecord(
      id: data.id.present ? data.id.value : this.id,
      aquariumId:
          data.aquariumId.present ? data.aquariumId.value : this.aquariumId,
      maintenanceType: data.maintenanceType.present
          ? data.maintenanceType.value
          : this.maintenanceType,
      volumeOrAmount: data.volumeOrAmount.present
          ? data.volumeOrAmount.value
          : this.volumeOrAmount,
      actionDate:
          data.actionDate.present ? data.actionDate.value : this.actionDate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceRecord(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('maintenanceType: $maintenanceType, ')
          ..write('volumeOrAmount: $volumeOrAmount, ')
          ..write('actionDate: $actionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, aquariumId, maintenanceType,
      volumeOrAmount, actionDate, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaintenanceRecord &&
          other.id == this.id &&
          other.aquariumId == this.aquariumId &&
          other.maintenanceType == this.maintenanceType &&
          other.volumeOrAmount == this.volumeOrAmount &&
          other.actionDate == this.actionDate &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class MaintenanceRecordsCompanion extends UpdateCompanion<MaintenanceRecord> {
  final Value<String> id;
  final Value<String> aquariumId;
  final Value<String> maintenanceType;
  final Value<double> volumeOrAmount;
  final Value<DateTime> actionDate;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const MaintenanceRecordsCompanion({
    this.id = const Value.absent(),
    this.aquariumId = const Value.absent(),
    this.maintenanceType = const Value.absent(),
    this.volumeOrAmount = const Value.absent(),
    this.actionDate = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaintenanceRecordsCompanion.insert({
    required String id,
    required String aquariumId,
    required String maintenanceType,
    required double volumeOrAmount,
    required DateTime actionDate,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        aquariumId = Value(aquariumId),
        maintenanceType = Value(maintenanceType),
        volumeOrAmount = Value(volumeOrAmount),
        actionDate = Value(actionDate),
        updatedAt = Value(updatedAt);
  static Insertable<MaintenanceRecord> custom({
    Expression<String>? id,
    Expression<String>? aquariumId,
    Expression<String>? maintenanceType,
    Expression<double>? volumeOrAmount,
    Expression<DateTime>? actionDate,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aquariumId != null) 'aquarium_id': aquariumId,
      if (maintenanceType != null) 'maintenance_type': maintenanceType,
      if (volumeOrAmount != null) 'volume_or_amount': volumeOrAmount,
      if (actionDate != null) 'action_date': actionDate,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaintenanceRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? aquariumId,
      Value<String>? maintenanceType,
      Value<double>? volumeOrAmount,
      Value<DateTime>? actionDate,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return MaintenanceRecordsCompanion(
      id: id ?? this.id,
      aquariumId: aquariumId ?? this.aquariumId,
      maintenanceType: maintenanceType ?? this.maintenanceType,
      volumeOrAmount: volumeOrAmount ?? this.volumeOrAmount,
      actionDate: actionDate ?? this.actionDate,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (aquariumId.present) {
      map['aquarium_id'] = Variable<String>(aquariumId.value);
    }
    if (maintenanceType.present) {
      map['maintenance_type'] = Variable<String>(maintenanceType.value);
    }
    if (volumeOrAmount.present) {
      map['volume_or_amount'] = Variable<double>(volumeOrAmount.value);
    }
    if (actionDate.present) {
      map['action_date'] = Variable<DateTime>(actionDate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaintenanceRecordsCompanion(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('maintenanceType: $maintenanceType, ')
          ..write('volumeOrAmount: $volumeOrAmount, ')
          ..write('actionDate: $actionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HydrobiontsTable extends Hydrobionts
    with TableInfo<$HydrobiontsTable, Hydrobiont> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HydrobiontsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aquariumIdMeta =
      const VerificationMeta('aquariumId');
  @override
  late final GeneratedColumn<String> aquariumId = GeneratedColumn<String>(
      'aquarium_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES aquariums (id)'));
  static const VerificationMeta _speciesMeta =
      const VerificationMeta('species');
  @override
  late final GeneratedColumn<String> species = GeneratedColumn<String>(
      'species', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hydrobiontTypeMeta =
      const VerificationMeta('hydrobiontType');
  @override
  late final GeneratedColumn<String> hydrobiontType = GeneratedColumn<String>(
      'hydrobiont_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionDateMeta =
      const VerificationMeta('actionDate');
  @override
  late final GeneratedColumn<DateTime> actionDate = GeneratedColumn<DateTime>(
      'action_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        aquariumId,
        species,
        quantity,
        action,
        hydrobiontType,
        actionDate,
        updatedAt,
        deleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hydrobionts';
  @override
  VerificationContext validateIntegrity(Insertable<Hydrobiont> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('aquarium_id')) {
      context.handle(
          _aquariumIdMeta,
          aquariumId.isAcceptableOrUnknown(
              data['aquarium_id']!, _aquariumIdMeta));
    } else if (isInserting) {
      context.missing(_aquariumIdMeta);
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species']!, _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('hydrobiont_type')) {
      context.handle(
          _hydrobiontTypeMeta,
          hydrobiontType.isAcceptableOrUnknown(
              data['hydrobiont_type']!, _hydrobiontTypeMeta));
    } else if (isInserting) {
      context.missing(_hydrobiontTypeMeta);
    }
    if (data.containsKey('action_date')) {
      context.handle(
          _actionDateMeta,
          actionDate.isAcceptableOrUnknown(
              data['action_date']!, _actionDateMeta));
    } else if (isInserting) {
      context.missing(_actionDateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Hydrobiont map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Hydrobiont(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      aquariumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aquarium_id'])!,
      species: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}species'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      hydrobiontType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hydrobiont_type'])!,
      actionDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}action_date'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $HydrobiontsTable createAlias(String alias) {
    return $HydrobiontsTable(attachedDatabase, alias);
  }
}

class Hydrobiont extends DataClass implements Insertable<Hydrobiont> {
  final String id;
  final String aquariumId;
  final String species;
  final int quantity;
  final String action;
  final String hydrobiontType;
  final DateTime actionDate;
  final DateTime updatedAt;
  final bool deleted;
  const Hydrobiont(
      {required this.id,
      required this.aquariumId,
      required this.species,
      required this.quantity,
      required this.action,
      required this.hydrobiontType,
      required this.actionDate,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['aquarium_id'] = Variable<String>(aquariumId);
    map['species'] = Variable<String>(species);
    map['quantity'] = Variable<int>(quantity);
    map['action'] = Variable<String>(action);
    map['hydrobiont_type'] = Variable<String>(hydrobiontType);
    map['action_date'] = Variable<DateTime>(actionDate);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  HydrobiontsCompanion toCompanion(bool nullToAbsent) {
    return HydrobiontsCompanion(
      id: Value(id),
      aquariumId: Value(aquariumId),
      species: Value(species),
      quantity: Value(quantity),
      action: Value(action),
      hydrobiontType: Value(hydrobiontType),
      actionDate: Value(actionDate),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory Hydrobiont.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Hydrobiont(
      id: serializer.fromJson<String>(json['id']),
      aquariumId: serializer.fromJson<String>(json['aquariumId']),
      species: serializer.fromJson<String>(json['species']),
      quantity: serializer.fromJson<int>(json['quantity']),
      action: serializer.fromJson<String>(json['action']),
      hydrobiontType: serializer.fromJson<String>(json['hydrobiontType']),
      actionDate: serializer.fromJson<DateTime>(json['actionDate']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'aquariumId': serializer.toJson<String>(aquariumId),
      'species': serializer.toJson<String>(species),
      'quantity': serializer.toJson<int>(quantity),
      'action': serializer.toJson<String>(action),
      'hydrobiontType': serializer.toJson<String>(hydrobiontType),
      'actionDate': serializer.toJson<DateTime>(actionDate),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  Hydrobiont copyWith(
          {String? id,
          String? aquariumId,
          String? species,
          int? quantity,
          String? action,
          String? hydrobiontType,
          DateTime? actionDate,
          DateTime? updatedAt,
          bool? deleted}) =>
      Hydrobiont(
        id: id ?? this.id,
        aquariumId: aquariumId ?? this.aquariumId,
        species: species ?? this.species,
        quantity: quantity ?? this.quantity,
        action: action ?? this.action,
        hydrobiontType: hydrobiontType ?? this.hydrobiontType,
        actionDate: actionDate ?? this.actionDate,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  Hydrobiont copyWithCompanion(HydrobiontsCompanion data) {
    return Hydrobiont(
      id: data.id.present ? data.id.value : this.id,
      aquariumId:
          data.aquariumId.present ? data.aquariumId.value : this.aquariumId,
      species: data.species.present ? data.species.value : this.species,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      action: data.action.present ? data.action.value : this.action,
      hydrobiontType: data.hydrobiontType.present
          ? data.hydrobiontType.value
          : this.hydrobiontType,
      actionDate:
          data.actionDate.present ? data.actionDate.value : this.actionDate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Hydrobiont(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('species: $species, ')
          ..write('quantity: $quantity, ')
          ..write('action: $action, ')
          ..write('hydrobiontType: $hydrobiontType, ')
          ..write('actionDate: $actionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, aquariumId, species, quantity, action,
      hydrobiontType, actionDate, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Hydrobiont &&
          other.id == this.id &&
          other.aquariumId == this.aquariumId &&
          other.species == this.species &&
          other.quantity == this.quantity &&
          other.action == this.action &&
          other.hydrobiontType == this.hydrobiontType &&
          other.actionDate == this.actionDate &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class HydrobiontsCompanion extends UpdateCompanion<Hydrobiont> {
  final Value<String> id;
  final Value<String> aquariumId;
  final Value<String> species;
  final Value<int> quantity;
  final Value<String> action;
  final Value<String> hydrobiontType;
  final Value<DateTime> actionDate;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const HydrobiontsCompanion({
    this.id = const Value.absent(),
    this.aquariumId = const Value.absent(),
    this.species = const Value.absent(),
    this.quantity = const Value.absent(),
    this.action = const Value.absent(),
    this.hydrobiontType = const Value.absent(),
    this.actionDate = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HydrobiontsCompanion.insert({
    required String id,
    required String aquariumId,
    required String species,
    required int quantity,
    required String action,
    required String hydrobiontType,
    required DateTime actionDate,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        aquariumId = Value(aquariumId),
        species = Value(species),
        quantity = Value(quantity),
        action = Value(action),
        hydrobiontType = Value(hydrobiontType),
        actionDate = Value(actionDate),
        updatedAt = Value(updatedAt);
  static Insertable<Hydrobiont> custom({
    Expression<String>? id,
    Expression<String>? aquariumId,
    Expression<String>? species,
    Expression<int>? quantity,
    Expression<String>? action,
    Expression<String>? hydrobiontType,
    Expression<DateTime>? actionDate,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aquariumId != null) 'aquarium_id': aquariumId,
      if (species != null) 'species': species,
      if (quantity != null) 'quantity': quantity,
      if (action != null) 'action': action,
      if (hydrobiontType != null) 'hydrobiont_type': hydrobiontType,
      if (actionDate != null) 'action_date': actionDate,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HydrobiontsCompanion copyWith(
      {Value<String>? id,
      Value<String>? aquariumId,
      Value<String>? species,
      Value<int>? quantity,
      Value<String>? action,
      Value<String>? hydrobiontType,
      Value<DateTime>? actionDate,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return HydrobiontsCompanion(
      id: id ?? this.id,
      aquariumId: aquariumId ?? this.aquariumId,
      species: species ?? this.species,
      quantity: quantity ?? this.quantity,
      action: action ?? this.action,
      hydrobiontType: hydrobiontType ?? this.hydrobiontType,
      actionDate: actionDate ?? this.actionDate,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (aquariumId.present) {
      map['aquarium_id'] = Variable<String>(aquariumId.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (hydrobiontType.present) {
      map['hydrobiont_type'] = Variable<String>(hydrobiontType.value);
    }
    if (actionDate.present) {
      map['action_date'] = Variable<DateTime>(actionDate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HydrobiontsCompanion(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('species: $species, ')
          ..write('quantity: $quantity, ')
          ..write('action: $action, ')
          ..write('hydrobiontType: $hydrobiontType, ')
          ..write('actionDate: $actionDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aquariumIdMeta =
      const VerificationMeta('aquariumId');
  @override
  late final GeneratedColumn<String> aquariumId = GeneratedColumn<String>(
      'aquarium_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES aquariums (id)'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteDateMeta =
      const VerificationMeta('noteDate');
  @override
  late final GeneratedColumn<DateTime> noteDate = GeneratedColumn<DateTime>(
      'note_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, aquariumId, content, noteDate, updatedAt, deleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('aquarium_id')) {
      context.handle(
          _aquariumIdMeta,
          aquariumId.isAcceptableOrUnknown(
              data['aquarium_id']!, _aquariumIdMeta));
    } else if (isInserting) {
      context.missing(_aquariumIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('note_date')) {
      context.handle(_noteDateMeta,
          noteDate.isAcceptableOrUnknown(data['note_date']!, _noteDateMeta));
    } else if (isInserting) {
      context.missing(_noteDateMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      aquariumId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aquarium_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      noteDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}note_date'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String aquariumId;
  final String content;
  final DateTime noteDate;
  final DateTime updatedAt;
  final bool deleted;
  const Note(
      {required this.id,
      required this.aquariumId,
      required this.content,
      required this.noteDate,
      required this.updatedAt,
      required this.deleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['aquarium_id'] = Variable<String>(aquariumId);
    map['content'] = Variable<String>(content);
    map['note_date'] = Variable<DateTime>(noteDate);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      aquariumId: Value(aquariumId),
      content: Value(content),
      noteDate: Value(noteDate),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      aquariumId: serializer.fromJson<String>(json['aquariumId']),
      content: serializer.fromJson<String>(json['content']),
      noteDate: serializer.fromJson<DateTime>(json['noteDate']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'aquariumId': serializer.toJson<String>(aquariumId),
      'content': serializer.toJson<String>(content),
      'noteDate': serializer.toJson<DateTime>(noteDate),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  Note copyWith(
          {String? id,
          String? aquariumId,
          String? content,
          DateTime? noteDate,
          DateTime? updatedAt,
          bool? deleted}) =>
      Note(
        id: id ?? this.id,
        aquariumId: aquariumId ?? this.aquariumId,
        content: content ?? this.content,
        noteDate: noteDate ?? this.noteDate,
        updatedAt: updatedAt ?? this.updatedAt,
        deleted: deleted ?? this.deleted,
      );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      aquariumId:
          data.aquariumId.present ? data.aquariumId.value : this.aquariumId,
      content: data.content.present ? data.content.value : this.content,
      noteDate: data.noteDate.present ? data.noteDate.value : this.noteDate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('content: $content, ')
          ..write('noteDate: $noteDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, aquariumId, content, noteDate, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.aquariumId == this.aquariumId &&
          other.content == this.content &&
          other.noteDate == this.noteDate &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> aquariumId;
  final Value<String> content;
  final Value<DateTime> noteDate;
  final Value<DateTime> updatedAt;
  final Value<bool> deleted;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.aquariumId = const Value.absent(),
    this.content = const Value.absent(),
    this.noteDate = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    required String aquariumId,
    required String content,
    required DateTime noteDate,
    required DateTime updatedAt,
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        aquariumId = Value(aquariumId),
        content = Value(content),
        noteDate = Value(noteDate),
        updatedAt = Value(updatedAt);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<String>? aquariumId,
    Expression<String>? content,
    Expression<DateTime>? noteDate,
    Expression<DateTime>? updatedAt,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aquariumId != null) 'aquarium_id': aquariumId,
      if (content != null) 'content': content,
      if (noteDate != null) 'note_date': noteDate,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith(
      {Value<String>? id,
      Value<String>? aquariumId,
      Value<String>? content,
      Value<DateTime>? noteDate,
      Value<DateTime>? updatedAt,
      Value<bool>? deleted,
      Value<int>? rowid}) {
    return NotesCompanion(
      id: id ?? this.id,
      aquariumId: aquariumId ?? this.aquariumId,
      content: content ?? this.content,
      noteDate: noteDate ?? this.noteDate,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (aquariumId.present) {
      map['aquarium_id'] = Variable<String>(aquariumId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (noteDate.present) {
      map['note_date'] = Variable<DateTime>(noteDate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('aquariumId: $aquariumId, ')
          ..write('content: $content, ')
          ..write('noteDate: $noteDate, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetaTable extends SyncMeta
    with TableInfo<$SyncMetaTable, SyncMetaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_meta';
  @override
  VerificationContext validateIntegrity(Insertable<SyncMetaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  SyncMetaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetaData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $SyncMetaTable createAlias(String alias) {
    return $SyncMetaTable(attachedDatabase, alias);
  }
}

class SyncMetaData extends DataClass implements Insertable<SyncMetaData> {
  final String key;
  final String value;
  const SyncMetaData({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  SyncMetaCompanion toCompanion(bool nullToAbsent) {
    return SyncMetaCompanion(
      key: Value(key),
      value: Value(value),
    );
  }

  factory SyncMetaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetaData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  SyncMetaData copyWith({String? key, String? value}) => SyncMetaData(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  SyncMetaData copyWithCompanion(SyncMetaCompanion data) {
    return SyncMetaData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaData(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetaData &&
          other.key == this.key &&
          other.value == this.value);
}

class SyncMetaCompanion extends UpdateCompanion<SyncMetaData> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const SyncMetaCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetaCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<SyncMetaData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetaCompanion copyWith(
      {Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return SyncMetaCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetaCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AquariumsTable aquariums = $AquariumsTable(this);
  late final $AquariumLightsTable aquariumLights = $AquariumLightsTable(this);
  late final $TestTypesTable testTypes = $TestTypesTable(this);
  late final $WaterTestsTable waterTests = $WaterTestsTable(this);
  late final $FertilizerTypesTable fertilizerTypes =
      $FertilizerTypesTable(this);
  late final $FertilizerApplicationsTable fertilizerApplications =
      $FertilizerApplicationsTable(this);
  late final $MaintenanceRecordsTable maintenanceRecords =
      $MaintenanceRecordsTable(this);
  late final $HydrobiontsTable hydrobionts = $HydrobiontsTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $SyncMetaTable syncMeta = $SyncMetaTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        aquariums,
        aquariumLights,
        testTypes,
        waterTests,
        fertilizerTypes,
        fertilizerApplications,
        maintenanceRecords,
        hydrobionts,
        notes,
        syncMeta
      ];
}

typedef $$AquariumsTableCreateCompanionBuilder = AquariumsCompanion Function({
  required String id,
  required String name,
  required int volume,
  required double lengthCm,
  required double widthCm,
  required double heightCm,
  Value<DateTime?> launchDate,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$AquariumsTableUpdateCompanionBuilder = AquariumsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> volume,
  Value<double> lengthCm,
  Value<double> widthCm,
  Value<double> heightCm,
  Value<DateTime?> launchDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$AquariumsTableReferences
    extends BaseReferences<_$AppDatabase, $AquariumsTable, Aquarium> {
  $$AquariumsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AquariumLightsTable, List<AquariumLight>>
      _aquariumLightsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.aquariumLights,
              aliasName: 'aquariums__id__aquarium_lights__aquarium_id');

  $$AquariumLightsTableProcessedTableManager get aquariumLightsRefs {
    final manager = $$AquariumLightsTableTableManager($_db, $_db.aquariumLights)
        .filter((f) => f.aquariumId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_aquariumLightsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WaterTestsTable, List<WaterTest>>
      _waterTestsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.waterTests,
              aliasName: 'aquariums__id__water_tests__aquarium_id');

  $$WaterTestsTableProcessedTableManager get waterTestsRefs {
    final manager = $$WaterTestsTableTableManager($_db, $_db.waterTests)
        .filter((f) => f.aquariumId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_waterTestsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FertilizerApplicationsTable,
      List<FertilizerApplication>> _fertilizerApplicationsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.fertilizerApplications,
          aliasName: 'aquariums__id__fertilizer_applications__aquarium_id');

  $$FertilizerApplicationsTableProcessedTableManager
      get fertilizerApplicationsRefs {
    final manager = $$FertilizerApplicationsTableTableManager(
            $_db, $_db.fertilizerApplications)
        .filter((f) => f.aquariumId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_fertilizerApplicationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MaintenanceRecordsTable, List<MaintenanceRecord>>
      _maintenanceRecordsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.maintenanceRecords,
              aliasName: 'aquariums__id__maintenance_records__aquarium_id');

  $$MaintenanceRecordsTableProcessedTableManager get maintenanceRecordsRefs {
    final manager = $$MaintenanceRecordsTableTableManager(
            $_db, $_db.maintenanceRecords)
        .filter((f) => f.aquariumId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_maintenanceRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$HydrobiontsTable, List<Hydrobiont>>
      _hydrobiontsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.hydrobionts,
              aliasName: 'aquariums__id__hydrobionts__aquarium_id');

  $$HydrobiontsTableProcessedTableManager get hydrobiontsRefs {
    final manager = $$HydrobiontsTableTableManager($_db, $_db.hydrobionts)
        .filter((f) => f.aquariumId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_hydrobiontsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$NotesTable, List<Note>> _notesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.notes,
          aliasName: 'aquariums__id__notes__aquarium_id');

  $$NotesTableProcessedTableManager get notesRefs {
    final manager = $$NotesTableTableManager($_db, $_db.notes)
        .filter((f) => f.aquariumId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_notesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AquariumsTableFilterComposer
    extends Composer<_$AppDatabase, $AquariumsTable> {
  $$AquariumsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get volume => $composableBuilder(
      column: $table.volume, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get lengthCm => $composableBuilder(
      column: $table.lengthCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get widthCm => $composableBuilder(
      column: $table.widthCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get launchDate => $composableBuilder(
      column: $table.launchDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  Expression<bool> aquariumLightsRefs(
      Expression<bool> Function($$AquariumLightsTableFilterComposer f) f) {
    final $$AquariumLightsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.aquariumLights,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumLightsTableFilterComposer(
              $db: $db,
              $table: $db.aquariumLights,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> waterTestsRefs(
      Expression<bool> Function($$WaterTestsTableFilterComposer f) f) {
    final $$WaterTestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.waterTests,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WaterTestsTableFilterComposer(
              $db: $db,
              $table: $db.waterTests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> fertilizerApplicationsRefs(
      Expression<bool> Function($$FertilizerApplicationsTableFilterComposer f)
          f) {
    final $$FertilizerApplicationsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.fertilizerApplications,
            getReferencedColumn: (t) => t.aquariumId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$FertilizerApplicationsTableFilterComposer(
                  $db: $db,
                  $table: $db.fertilizerApplications,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> maintenanceRecordsRefs(
      Expression<bool> Function($$MaintenanceRecordsTableFilterComposer f) f) {
    final $$MaintenanceRecordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.maintenanceRecords,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MaintenanceRecordsTableFilterComposer(
              $db: $db,
              $table: $db.maintenanceRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> hydrobiontsRefs(
      Expression<bool> Function($$HydrobiontsTableFilterComposer f) f) {
    final $$HydrobiontsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.hydrobionts,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HydrobiontsTableFilterComposer(
              $db: $db,
              $table: $db.hydrobionts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> notesRefs(
      Expression<bool> Function($$NotesTableFilterComposer f) f) {
    final $$NotesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.notes,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NotesTableFilterComposer(
              $db: $db,
              $table: $db.notes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AquariumsTableOrderingComposer
    extends Composer<_$AppDatabase, $AquariumsTable> {
  $$AquariumsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get volume => $composableBuilder(
      column: $table.volume, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get lengthCm => $composableBuilder(
      column: $table.lengthCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get widthCm => $composableBuilder(
      column: $table.widthCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get heightCm => $composableBuilder(
      column: $table.heightCm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get launchDate => $composableBuilder(
      column: $table.launchDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));
}

class $$AquariumsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AquariumsTable> {
  $$AquariumsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<double> get lengthCm =>
      $composableBuilder(column: $table.lengthCm, builder: (column) => column);

  GeneratedColumn<double> get widthCm =>
      $composableBuilder(column: $table.widthCm, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

  GeneratedColumn<DateTime> get launchDate => $composableBuilder(
      column: $table.launchDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  Expression<T> aquariumLightsRefs<T extends Object>(
      Expression<T> Function($$AquariumLightsTableAnnotationComposer a) f) {
    final $$AquariumLightsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.aquariumLights,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumLightsTableAnnotationComposer(
              $db: $db,
              $table: $db.aquariumLights,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> waterTestsRefs<T extends Object>(
      Expression<T> Function($$WaterTestsTableAnnotationComposer a) f) {
    final $$WaterTestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.waterTests,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WaterTestsTableAnnotationComposer(
              $db: $db,
              $table: $db.waterTests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> fertilizerApplicationsRefs<T extends Object>(
      Expression<T> Function($$FertilizerApplicationsTableAnnotationComposer a)
          f) {
    final $$FertilizerApplicationsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.fertilizerApplications,
            getReferencedColumn: (t) => t.aquariumId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$FertilizerApplicationsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.fertilizerApplications,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> maintenanceRecordsRefs<T extends Object>(
      Expression<T> Function($$MaintenanceRecordsTableAnnotationComposer a) f) {
    final $$MaintenanceRecordsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.maintenanceRecords,
            getReferencedColumn: (t) => t.aquariumId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MaintenanceRecordsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.maintenanceRecords,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> hydrobiontsRefs<T extends Object>(
      Expression<T> Function($$HydrobiontsTableAnnotationComposer a) f) {
    final $$HydrobiontsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.hydrobionts,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HydrobiontsTableAnnotationComposer(
              $db: $db,
              $table: $db.hydrobionts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> notesRefs<T extends Object>(
      Expression<T> Function($$NotesTableAnnotationComposer a) f) {
    final $$NotesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.notes,
        getReferencedColumn: (t) => t.aquariumId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NotesTableAnnotationComposer(
              $db: $db,
              $table: $db.notes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AquariumsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AquariumsTable,
    Aquarium,
    $$AquariumsTableFilterComposer,
    $$AquariumsTableOrderingComposer,
    $$AquariumsTableAnnotationComposer,
    $$AquariumsTableCreateCompanionBuilder,
    $$AquariumsTableUpdateCompanionBuilder,
    (Aquarium, $$AquariumsTableReferences),
    Aquarium,
    PrefetchHooks Function(
        {bool aquariumLightsRefs,
        bool waterTestsRefs,
        bool fertilizerApplicationsRefs,
        bool maintenanceRecordsRefs,
        bool hydrobiontsRefs,
        bool notesRefs})> {
  $$AquariumsTableTableManager(_$AppDatabase db, $AquariumsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AquariumsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AquariumsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AquariumsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> volume = const Value.absent(),
            Value<double> lengthCm = const Value.absent(),
            Value<double> widthCm = const Value.absent(),
            Value<double> heightCm = const Value.absent(),
            Value<DateTime?> launchDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AquariumsCompanion(
            id: id,
            name: name,
            volume: volume,
            lengthCm: lengthCm,
            widthCm: widthCm,
            heightCm: heightCm,
            launchDate: launchDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required int volume,
            required double lengthCm,
            required double widthCm,
            required double heightCm,
            Value<DateTime?> launchDate = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AquariumsCompanion.insert(
            id: id,
            name: name,
            volume: volume,
            lengthCm: lengthCm,
            widthCm: widthCm,
            heightCm: heightCm,
            launchDate: launchDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AquariumsTable, Aquarium>(table),
                    $$AquariumsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {aquariumLightsRefs = false,
              waterTestsRefs = false,
              fertilizerApplicationsRefs = false,
              maintenanceRecordsRefs = false,
              hydrobiontsRefs = false,
              notesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (aquariumLightsRefs) db.aquariumLights,
                if (waterTestsRefs) db.waterTests,
                if (fertilizerApplicationsRefs) db.fertilizerApplications,
                if (maintenanceRecordsRefs) db.maintenanceRecords,
                if (hydrobiontsRefs) db.hydrobionts,
                if (notesRefs) db.notes
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (aquariumLightsRefs)
                    await $_getPrefetchedData<Aquarium, $AquariumsTable,
                            AquariumLight>(
                        currentTable: table,
                        referencedTable: $$AquariumsTableReferences
                            ._aquariumLightsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AquariumsTableReferences(db, table, p0)
                                .aquariumLightsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.aquariumId == item.id),
                        typedResults: items),
                  if (waterTestsRefs)
                    await $_getPrefetchedData<Aquarium, $AquariumsTable,
                            WaterTest>(
                        currentTable: table,
                        referencedTable:
                            $$AquariumsTableReferences._waterTestsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AquariumsTableReferences(db, table, p0)
                                .waterTestsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.aquariumId == item.id),
                        typedResults: items),
                  if (fertilizerApplicationsRefs)
                    await $_getPrefetchedData<Aquarium, $AquariumsTable,
                            FertilizerApplication>(
                        currentTable: table,
                        referencedTable: $$AquariumsTableReferences
                            ._fertilizerApplicationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AquariumsTableReferences(db, table, p0)
                                .fertilizerApplicationsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.aquariumId == item.id),
                        typedResults: items),
                  if (maintenanceRecordsRefs)
                    await $_getPrefetchedData<Aquarium, $AquariumsTable,
                            MaintenanceRecord>(
                        currentTable: table,
                        referencedTable: $$AquariumsTableReferences
                            ._maintenanceRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AquariumsTableReferences(db, table, p0)
                                .maintenanceRecordsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.aquariumId == item.id),
                        typedResults: items),
                  if (hydrobiontsRefs)
                    await $_getPrefetchedData<Aquarium, $AquariumsTable,
                            Hydrobiont>(
                        currentTable: table,
                        referencedTable: $$AquariumsTableReferences
                            ._hydrobiontsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AquariumsTableReferences(db, table, p0)
                                .hydrobiontsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.aquariumId == item.id),
                        typedResults: items),
                  if (notesRefs)
                    await $_getPrefetchedData<Aquarium, $AquariumsTable, Note>(
                        currentTable: table,
                        referencedTable:
                            $$AquariumsTableReferences._notesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AquariumsTableReferences(db, table, p0).notesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.aquariumId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AquariumsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AquariumsTable,
    Aquarium,
    $$AquariumsTableFilterComposer,
    $$AquariumsTableOrderingComposer,
    $$AquariumsTableAnnotationComposer,
    $$AquariumsTableCreateCompanionBuilder,
    $$AquariumsTableUpdateCompanionBuilder,
    (Aquarium, $$AquariumsTableReferences),
    Aquarium,
    PrefetchHooks Function(
        {bool aquariumLightsRefs,
        bool waterTestsRefs,
        bool fertilizerApplicationsRefs,
        bool maintenanceRecordsRefs,
        bool hydrobiontsRefs,
        bool notesRefs})>;
typedef $$AquariumLightsTableCreateCompanionBuilder = AquariumLightsCompanion
    Function({
  required String id,
  required String aquariumId,
  required String lightType,
  required double powerW,
  required String startTime,
  required String endTime,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$AquariumLightsTableUpdateCompanionBuilder = AquariumLightsCompanion
    Function({
  Value<String> id,
  Value<String> aquariumId,
  Value<String> lightType,
  Value<double> powerW,
  Value<String> startTime,
  Value<String> endTime,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$AquariumLightsTableReferences
    extends BaseReferences<_$AppDatabase, $AquariumLightsTable, AquariumLight> {
  $$AquariumLightsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AquariumsTable _aquariumIdTable(_$AppDatabase db) =>
      db.aquariums.createAlias('aquarium_lights__aquarium_id__aquariums__id');

  $$AquariumsTableProcessedTableManager get aquariumId {
    final $_column = $_itemColumn<String>('aquarium_id')!;

    final manager = $$AquariumsTableTableManager($_db, $_db.aquariums)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aquariumIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AquariumLightsTableFilterComposer
    extends Composer<_$AppDatabase, $AquariumLightsTable> {
  $$AquariumLightsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lightType => $composableBuilder(
      column: $table.lightType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get powerW => $composableBuilder(
      column: $table.powerW, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  $$AquariumsTableFilterComposer get aquariumId {
    final $$AquariumsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableFilterComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AquariumLightsTableOrderingComposer
    extends Composer<_$AppDatabase, $AquariumLightsTable> {
  $$AquariumLightsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lightType => $composableBuilder(
      column: $table.lightType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get powerW => $composableBuilder(
      column: $table.powerW, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));

  $$AquariumsTableOrderingComposer get aquariumId {
    final $$AquariumsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableOrderingComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AquariumLightsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AquariumLightsTable> {
  $$AquariumLightsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get lightType =>
      $composableBuilder(column: $table.lightType, builder: (column) => column);

  GeneratedColumn<double> get powerW =>
      $composableBuilder(column: $table.powerW, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  $$AquariumsTableAnnotationComposer get aquariumId {
    final $$AquariumsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableAnnotationComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AquariumLightsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AquariumLightsTable,
    AquariumLight,
    $$AquariumLightsTableFilterComposer,
    $$AquariumLightsTableOrderingComposer,
    $$AquariumLightsTableAnnotationComposer,
    $$AquariumLightsTableCreateCompanionBuilder,
    $$AquariumLightsTableUpdateCompanionBuilder,
    (AquariumLight, $$AquariumLightsTableReferences),
    AquariumLight,
    PrefetchHooks Function({bool aquariumId})> {
  $$AquariumLightsTableTableManager(
      _$AppDatabase db, $AquariumLightsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AquariumLightsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AquariumLightsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AquariumLightsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> aquariumId = const Value.absent(),
            Value<String> lightType = const Value.absent(),
            Value<double> powerW = const Value.absent(),
            Value<String> startTime = const Value.absent(),
            Value<String> endTime = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AquariumLightsCompanion(
            id: id,
            aquariumId: aquariumId,
            lightType: lightType,
            powerW: powerW,
            startTime: startTime,
            endTime: endTime,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String aquariumId,
            required String lightType,
            required double powerW,
            required String startTime,
            required String endTime,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AquariumLightsCompanion.insert(
            id: id,
            aquariumId: aquariumId,
            lightType: lightType,
            powerW: powerW,
            startTime: startTime,
            endTime: endTime,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AquariumLightsTable, AquariumLight>(table),
                    $$AquariumLightsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({aquariumId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (aquariumId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.aquariumId,
                    referencedTable:
                        $$AquariumLightsTableReferences._aquariumIdTable(db),
                    referencedColumn:
                        $$AquariumLightsTableReferences._aquariumIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AquariumLightsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AquariumLightsTable,
    AquariumLight,
    $$AquariumLightsTableFilterComposer,
    $$AquariumLightsTableOrderingComposer,
    $$AquariumLightsTableAnnotationComposer,
    $$AquariumLightsTableCreateCompanionBuilder,
    $$AquariumLightsTableUpdateCompanionBuilder,
    (AquariumLight, $$AquariumLightsTableReferences),
    AquariumLight,
    PrefetchHooks Function({bool aquariumId})>;
typedef $$TestTypesTableCreateCompanionBuilder = TestTypesCompanion Function({
  required String id,
  required String name,
  required bool isDefault,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$TestTypesTableUpdateCompanionBuilder = TestTypesCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<bool> isDefault,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$TestTypesTableReferences
    extends BaseReferences<_$AppDatabase, $TestTypesTable, TestType> {
  $$TestTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WaterTestsTable, List<WaterTest>>
      _waterTestsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.waterTests,
              aliasName: 'test_types__id__water_tests__test_type_id');

  $$WaterTestsTableProcessedTableManager get waterTestsRefs {
    final manager = $$WaterTestsTableTableManager($_db, $_db.waterTests)
        .filter((f) => f.testTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_waterTestsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TestTypesTableFilterComposer
    extends Composer<_$AppDatabase, $TestTypesTable> {
  $$TestTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  Expression<bool> waterTestsRefs(
      Expression<bool> Function($$WaterTestsTableFilterComposer f) f) {
    final $$WaterTestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.waterTests,
        getReferencedColumn: (t) => t.testTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WaterTestsTableFilterComposer(
              $db: $db,
              $table: $db.waterTests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TestTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $TestTypesTable> {
  $$TestTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));
}

class $$TestTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TestTypesTable> {
  $$TestTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  Expression<T> waterTestsRefs<T extends Object>(
      Expression<T> Function($$WaterTestsTableAnnotationComposer a) f) {
    final $$WaterTestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.waterTests,
        getReferencedColumn: (t) => t.testTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WaterTestsTableAnnotationComposer(
              $db: $db,
              $table: $db.waterTests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TestTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TestTypesTable,
    TestType,
    $$TestTypesTableFilterComposer,
    $$TestTypesTableOrderingComposer,
    $$TestTypesTableAnnotationComposer,
    $$TestTypesTableCreateCompanionBuilder,
    $$TestTypesTableUpdateCompanionBuilder,
    (TestType, $$TestTypesTableReferences),
    TestType,
    PrefetchHooks Function({bool waterTestsRefs})> {
  $$TestTypesTableTableManager(_$AppDatabase db, $TestTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TestTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TestTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TestTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TestTypesCompanion(
            id: id,
            name: name,
            isDefault: isDefault,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required bool isDefault,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TestTypesCompanion.insert(
            id: id,
            name: name,
            isDefault: isDefault,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$TestTypesTable, TestType>(table),
                    $$TestTypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({waterTestsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (waterTestsRefs) db.waterTests],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (waterTestsRefs)
                    await $_getPrefetchedData<TestType, $TestTypesTable,
                            WaterTest>(
                        currentTable: table,
                        referencedTable:
                            $$TestTypesTableReferences._waterTestsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TestTypesTableReferences(db, table, p0)
                                .waterTestsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.testTypeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TestTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TestTypesTable,
    TestType,
    $$TestTypesTableFilterComposer,
    $$TestTypesTableOrderingComposer,
    $$TestTypesTableAnnotationComposer,
    $$TestTypesTableCreateCompanionBuilder,
    $$TestTypesTableUpdateCompanionBuilder,
    (TestType, $$TestTypesTableReferences),
    TestType,
    PrefetchHooks Function({bool waterTestsRefs})>;
typedef $$WaterTestsTableCreateCompanionBuilder = WaterTestsCompanion Function({
  required String id,
  required String aquariumId,
  required String testTypeId,
  required String value,
  required DateTime testDate,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$WaterTestsTableUpdateCompanionBuilder = WaterTestsCompanion Function({
  Value<String> id,
  Value<String> aquariumId,
  Value<String> testTypeId,
  Value<String> value,
  Value<DateTime> testDate,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$WaterTestsTableReferences
    extends BaseReferences<_$AppDatabase, $WaterTestsTable, WaterTest> {
  $$WaterTestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AquariumsTable _aquariumIdTable(_$AppDatabase db) =>
      db.aquariums.createAlias('water_tests__aquarium_id__aquariums__id');

  $$AquariumsTableProcessedTableManager get aquariumId {
    final $_column = $_itemColumn<String>('aquarium_id')!;

    final manager = $$AquariumsTableTableManager($_db, $_db.aquariums)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aquariumIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TestTypesTable _testTypeIdTable(_$AppDatabase db) =>
      db.testTypes.createAlias('water_tests__test_type_id__test_types__id');

  $$TestTypesTableProcessedTableManager get testTypeId {
    final $_column = $_itemColumn<String>('test_type_id')!;

    final manager = $$TestTypesTableTableManager($_db, $_db.testTypes)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_testTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WaterTestsTableFilterComposer
    extends Composer<_$AppDatabase, $WaterTestsTable> {
  $$WaterTestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get testDate => $composableBuilder(
      column: $table.testDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  $$AquariumsTableFilterComposer get aquariumId {
    final $$AquariumsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableFilterComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TestTypesTableFilterComposer get testTypeId {
    final $$TestTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.testTypeId,
        referencedTable: $db.testTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TestTypesTableFilterComposer(
              $db: $db,
              $table: $db.testTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WaterTestsTableOrderingComposer
    extends Composer<_$AppDatabase, $WaterTestsTable> {
  $$WaterTestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get testDate => $composableBuilder(
      column: $table.testDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));

  $$AquariumsTableOrderingComposer get aquariumId {
    final $$AquariumsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableOrderingComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TestTypesTableOrderingComposer get testTypeId {
    final $$TestTypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.testTypeId,
        referencedTable: $db.testTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TestTypesTableOrderingComposer(
              $db: $db,
              $table: $db.testTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WaterTestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WaterTestsTable> {
  $$WaterTestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get testDate =>
      $composableBuilder(column: $table.testDate, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  $$AquariumsTableAnnotationComposer get aquariumId {
    final $$AquariumsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableAnnotationComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TestTypesTableAnnotationComposer get testTypeId {
    final $$TestTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.testTypeId,
        referencedTable: $db.testTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TestTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.testTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WaterTestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WaterTestsTable,
    WaterTest,
    $$WaterTestsTableFilterComposer,
    $$WaterTestsTableOrderingComposer,
    $$WaterTestsTableAnnotationComposer,
    $$WaterTestsTableCreateCompanionBuilder,
    $$WaterTestsTableUpdateCompanionBuilder,
    (WaterTest, $$WaterTestsTableReferences),
    WaterTest,
    PrefetchHooks Function({bool aquariumId, bool testTypeId})> {
  $$WaterTestsTableTableManager(_$AppDatabase db, $WaterTestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WaterTestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WaterTestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WaterTestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> aquariumId = const Value.absent(),
            Value<String> testTypeId = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<DateTime> testDate = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WaterTestsCompanion(
            id: id,
            aquariumId: aquariumId,
            testTypeId: testTypeId,
            value: value,
            testDate: testDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String aquariumId,
            required String testTypeId,
            required String value,
            required DateTime testDate,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WaterTestsCompanion.insert(
            id: id,
            aquariumId: aquariumId,
            testTypeId: testTypeId,
            value: value,
            testDate: testDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$WaterTestsTable, WaterTest>(table),
                    $$WaterTestsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({aquariumId = false, testTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (aquariumId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.aquariumId,
                    referencedTable:
                        $$WaterTestsTableReferences._aquariumIdTable(db),
                    referencedColumn:
                        $$WaterTestsTableReferences._aquariumIdTable(db).id,
                  ) as T;
                }
                if (testTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.testTypeId,
                    referencedTable:
                        $$WaterTestsTableReferences._testTypeIdTable(db),
                    referencedColumn:
                        $$WaterTestsTableReferences._testTypeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WaterTestsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WaterTestsTable,
    WaterTest,
    $$WaterTestsTableFilterComposer,
    $$WaterTestsTableOrderingComposer,
    $$WaterTestsTableAnnotationComposer,
    $$WaterTestsTableCreateCompanionBuilder,
    $$WaterTestsTableUpdateCompanionBuilder,
    (WaterTest, $$WaterTestsTableReferences),
    WaterTest,
    PrefetchHooks Function({bool aquariumId, bool testTypeId})>;
typedef $$FertilizerTypesTableCreateCompanionBuilder = FertilizerTypesCompanion
    Function({
  required String id,
  required String name,
  required bool isDefault,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$FertilizerTypesTableUpdateCompanionBuilder = FertilizerTypesCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<bool> isDefault,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$FertilizerTypesTableReferences extends BaseReferences<
    _$AppDatabase, $FertilizerTypesTable, FertilizerType> {
  $$FertilizerTypesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FertilizerApplicationsTable,
      List<FertilizerApplication>> _fertilizerApplicationsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.fertilizerApplications,
          aliasName:
              'fertilizer_types__id__fertilizer_applications__fertilizer_type_id');

  $$FertilizerApplicationsTableProcessedTableManager
      get fertilizerApplicationsRefs {
    final manager = $$FertilizerApplicationsTableTableManager(
            $_db, $_db.fertilizerApplications)
        .filter((f) =>
            f.fertilizerTypeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_fertilizerApplicationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$FertilizerTypesTableFilterComposer
    extends Composer<_$AppDatabase, $FertilizerTypesTable> {
  $$FertilizerTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  Expression<bool> fertilizerApplicationsRefs(
      Expression<bool> Function($$FertilizerApplicationsTableFilterComposer f)
          f) {
    final $$FertilizerApplicationsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.fertilizerApplications,
            getReferencedColumn: (t) => t.fertilizerTypeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$FertilizerApplicationsTableFilterComposer(
                  $db: $db,
                  $table: $db.fertilizerApplications,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$FertilizerTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $FertilizerTypesTable> {
  $$FertilizerTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));
}

class $$FertilizerTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FertilizerTypesTable> {
  $$FertilizerTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  Expression<T> fertilizerApplicationsRefs<T extends Object>(
      Expression<T> Function($$FertilizerApplicationsTableAnnotationComposer a)
          f) {
    final $$FertilizerApplicationsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.fertilizerApplications,
            getReferencedColumn: (t) => t.fertilizerTypeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$FertilizerApplicationsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.fertilizerApplications,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$FertilizerTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FertilizerTypesTable,
    FertilizerType,
    $$FertilizerTypesTableFilterComposer,
    $$FertilizerTypesTableOrderingComposer,
    $$FertilizerTypesTableAnnotationComposer,
    $$FertilizerTypesTableCreateCompanionBuilder,
    $$FertilizerTypesTableUpdateCompanionBuilder,
    (FertilizerType, $$FertilizerTypesTableReferences),
    FertilizerType,
    PrefetchHooks Function({bool fertilizerApplicationsRefs})> {
  $$FertilizerTypesTableTableManager(
      _$AppDatabase db, $FertilizerTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FertilizerTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FertilizerTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FertilizerTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FertilizerTypesCompanion(
            id: id,
            name: name,
            isDefault: isDefault,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required bool isDefault,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FertilizerTypesCompanion.insert(
            id: id,
            name: name,
            isDefault: isDefault,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$FertilizerTypesTable, FertilizerType>(table),
                    $$FertilizerTypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({fertilizerApplicationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (fertilizerApplicationsRefs) db.fertilizerApplications
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (fertilizerApplicationsRefs)
                    await $_getPrefetchedData<FertilizerType,
                            $FertilizerTypesTable, FertilizerApplication>(
                        currentTable: table,
                        referencedTable: $$FertilizerTypesTableReferences
                            ._fertilizerApplicationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$FertilizerTypesTableReferences(db, table, p0)
                                .fertilizerApplicationsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.fertilizerTypeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$FertilizerTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FertilizerTypesTable,
    FertilizerType,
    $$FertilizerTypesTableFilterComposer,
    $$FertilizerTypesTableOrderingComposer,
    $$FertilizerTypesTableAnnotationComposer,
    $$FertilizerTypesTableCreateCompanionBuilder,
    $$FertilizerTypesTableUpdateCompanionBuilder,
    (FertilizerType, $$FertilizerTypesTableReferences),
    FertilizerType,
    PrefetchHooks Function({bool fertilizerApplicationsRefs})>;
typedef $$FertilizerApplicationsTableCreateCompanionBuilder
    = FertilizerApplicationsCompanion Function({
  required String id,
  required String aquariumId,
  required String fertilizerTypeId,
  required double dosage,
  required double totalAmount,
  required DateTime actionDate,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$FertilizerApplicationsTableUpdateCompanionBuilder
    = FertilizerApplicationsCompanion Function({
  Value<String> id,
  Value<String> aquariumId,
  Value<String> fertilizerTypeId,
  Value<double> dosage,
  Value<double> totalAmount,
  Value<DateTime> actionDate,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$FertilizerApplicationsTableReferences extends BaseReferences<
    _$AppDatabase, $FertilizerApplicationsTable, FertilizerApplication> {
  $$FertilizerApplicationsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AquariumsTable _aquariumIdTable(_$AppDatabase db) => db.aquariums
      .createAlias('fertilizer_applications__aquarium_id__aquariums__id');

  $$AquariumsTableProcessedTableManager get aquariumId {
    final $_column = $_itemColumn<String>('aquarium_id')!;

    final manager = $$AquariumsTableTableManager($_db, $_db.aquariums)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aquariumIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $FertilizerTypesTable _fertilizerTypeIdTable(_$AppDatabase db) =>
      db.fertilizerTypes.createAlias(
          'fertilizer_applications__fertilizer_type_id__fertilizer_types__id');

  $$FertilizerTypesTableProcessedTableManager get fertilizerTypeId {
    final $_column = $_itemColumn<String>('fertilizer_type_id')!;

    final manager =
        $$FertilizerTypesTableTableManager($_db, $_db.fertilizerTypes)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fertilizerTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FertilizerApplicationsTableFilterComposer
    extends Composer<_$AppDatabase, $FertilizerApplicationsTable> {
  $$FertilizerApplicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  $$AquariumsTableFilterComposer get aquariumId {
    final $$AquariumsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableFilterComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$FertilizerTypesTableFilterComposer get fertilizerTypeId {
    final $$FertilizerTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fertilizerTypeId,
        referencedTable: $db.fertilizerTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FertilizerTypesTableFilterComposer(
              $db: $db,
              $table: $db.fertilizerTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FertilizerApplicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $FertilizerApplicationsTable> {
  $$FertilizerApplicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get dosage => $composableBuilder(
      column: $table.dosage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));

  $$AquariumsTableOrderingComposer get aquariumId {
    final $$AquariumsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableOrderingComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$FertilizerTypesTableOrderingComposer get fertilizerTypeId {
    final $$FertilizerTypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fertilizerTypeId,
        referencedTable: $db.fertilizerTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FertilizerTypesTableOrderingComposer(
              $db: $db,
              $table: $db.fertilizerTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FertilizerApplicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FertilizerApplicationsTable> {
  $$FertilizerApplicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  $$AquariumsTableAnnotationComposer get aquariumId {
    final $$AquariumsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableAnnotationComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$FertilizerTypesTableAnnotationComposer get fertilizerTypeId {
    final $$FertilizerTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fertilizerTypeId,
        referencedTable: $db.fertilizerTypes,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FertilizerTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.fertilizerTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FertilizerApplicationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FertilizerApplicationsTable,
    FertilizerApplication,
    $$FertilizerApplicationsTableFilterComposer,
    $$FertilizerApplicationsTableOrderingComposer,
    $$FertilizerApplicationsTableAnnotationComposer,
    $$FertilizerApplicationsTableCreateCompanionBuilder,
    $$FertilizerApplicationsTableUpdateCompanionBuilder,
    (FertilizerApplication, $$FertilizerApplicationsTableReferences),
    FertilizerApplication,
    PrefetchHooks Function({bool aquariumId, bool fertilizerTypeId})> {
  $$FertilizerApplicationsTableTableManager(
      _$AppDatabase db, $FertilizerApplicationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FertilizerApplicationsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$FertilizerApplicationsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FertilizerApplicationsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> aquariumId = const Value.absent(),
            Value<String> fertilizerTypeId = const Value.absent(),
            Value<double> dosage = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<DateTime> actionDate = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FertilizerApplicationsCompanion(
            id: id,
            aquariumId: aquariumId,
            fertilizerTypeId: fertilizerTypeId,
            dosage: dosage,
            totalAmount: totalAmount,
            actionDate: actionDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String aquariumId,
            required String fertilizerTypeId,
            required double dosage,
            required double totalAmount,
            required DateTime actionDate,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FertilizerApplicationsCompanion.insert(
            id: id,
            aquariumId: aquariumId,
            fertilizerTypeId: fertilizerTypeId,
            dosage: dosage,
            totalAmount: totalAmount,
            actionDate: actionDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$FertilizerApplicationsTable,
                        FertilizerApplication>(table),
                    $$FertilizerApplicationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {aquariumId = false, fertilizerTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (aquariumId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.aquariumId,
                    referencedTable: $$FertilizerApplicationsTableReferences
                        ._aquariumIdTable(db),
                    referencedColumn: $$FertilizerApplicationsTableReferences
                        ._aquariumIdTable(db)
                        .id,
                  ) as T;
                }
                if (fertilizerTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fertilizerTypeId,
                    referencedTable: $$FertilizerApplicationsTableReferences
                        ._fertilizerTypeIdTable(db),
                    referencedColumn: $$FertilizerApplicationsTableReferences
                        ._fertilizerTypeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FertilizerApplicationsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $FertilizerApplicationsTable,
        FertilizerApplication,
        $$FertilizerApplicationsTableFilterComposer,
        $$FertilizerApplicationsTableOrderingComposer,
        $$FertilizerApplicationsTableAnnotationComposer,
        $$FertilizerApplicationsTableCreateCompanionBuilder,
        $$FertilizerApplicationsTableUpdateCompanionBuilder,
        (FertilizerApplication, $$FertilizerApplicationsTableReferences),
        FertilizerApplication,
        PrefetchHooks Function({bool aquariumId, bool fertilizerTypeId})>;
typedef $$MaintenanceRecordsTableCreateCompanionBuilder
    = MaintenanceRecordsCompanion Function({
  required String id,
  required String aquariumId,
  required String maintenanceType,
  required double volumeOrAmount,
  required DateTime actionDate,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$MaintenanceRecordsTableUpdateCompanionBuilder
    = MaintenanceRecordsCompanion Function({
  Value<String> id,
  Value<String> aquariumId,
  Value<String> maintenanceType,
  Value<double> volumeOrAmount,
  Value<DateTime> actionDate,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$MaintenanceRecordsTableReferences extends BaseReferences<
    _$AppDatabase, $MaintenanceRecordsTable, MaintenanceRecord> {
  $$MaintenanceRecordsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $AquariumsTable _aquariumIdTable(_$AppDatabase db) => db.aquariums
      .createAlias('maintenance_records__aquarium_id__aquariums__id');

  $$AquariumsTableProcessedTableManager get aquariumId {
    final $_column = $_itemColumn<String>('aquarium_id')!;

    final manager = $$AquariumsTableTableManager($_db, $_db.aquariums)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aquariumIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MaintenanceRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maintenanceType => $composableBuilder(
      column: $table.maintenanceType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get volumeOrAmount => $composableBuilder(
      column: $table.volumeOrAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  $$AquariumsTableFilterComposer get aquariumId {
    final $$AquariumsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableFilterComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaintenanceRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maintenanceType => $composableBuilder(
      column: $table.maintenanceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get volumeOrAmount => $composableBuilder(
      column: $table.volumeOrAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));

  $$AquariumsTableOrderingComposer get aquariumId {
    final $$AquariumsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableOrderingComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaintenanceRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaintenanceRecordsTable> {
  $$MaintenanceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get maintenanceType => $composableBuilder(
      column: $table.maintenanceType, builder: (column) => column);

  GeneratedColumn<double> get volumeOrAmount => $composableBuilder(
      column: $table.volumeOrAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  $$AquariumsTableAnnotationComposer get aquariumId {
    final $$AquariumsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableAnnotationComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaintenanceRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MaintenanceRecordsTable,
    MaintenanceRecord,
    $$MaintenanceRecordsTableFilterComposer,
    $$MaintenanceRecordsTableOrderingComposer,
    $$MaintenanceRecordsTableAnnotationComposer,
    $$MaintenanceRecordsTableCreateCompanionBuilder,
    $$MaintenanceRecordsTableUpdateCompanionBuilder,
    (MaintenanceRecord, $$MaintenanceRecordsTableReferences),
    MaintenanceRecord,
    PrefetchHooks Function({bool aquariumId})> {
  $$MaintenanceRecordsTableTableManager(
      _$AppDatabase db, $MaintenanceRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaintenanceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MaintenanceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaintenanceRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> aquariumId = const Value.absent(),
            Value<String> maintenanceType = const Value.absent(),
            Value<double> volumeOrAmount = const Value.absent(),
            Value<DateTime> actionDate = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MaintenanceRecordsCompanion(
            id: id,
            aquariumId: aquariumId,
            maintenanceType: maintenanceType,
            volumeOrAmount: volumeOrAmount,
            actionDate: actionDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String aquariumId,
            required String maintenanceType,
            required double volumeOrAmount,
            required DateTime actionDate,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MaintenanceRecordsCompanion.insert(
            id: id,
            aquariumId: aquariumId,
            maintenanceType: maintenanceType,
            volumeOrAmount: volumeOrAmount,
            actionDate: actionDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$MaintenanceRecordsTable, MaintenanceRecord>(
                        table),
                    $$MaintenanceRecordsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({aquariumId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (aquariumId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.aquariumId,
                    referencedTable: $$MaintenanceRecordsTableReferences
                        ._aquariumIdTable(db),
                    referencedColumn: $$MaintenanceRecordsTableReferences
                        ._aquariumIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MaintenanceRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MaintenanceRecordsTable,
    MaintenanceRecord,
    $$MaintenanceRecordsTableFilterComposer,
    $$MaintenanceRecordsTableOrderingComposer,
    $$MaintenanceRecordsTableAnnotationComposer,
    $$MaintenanceRecordsTableCreateCompanionBuilder,
    $$MaintenanceRecordsTableUpdateCompanionBuilder,
    (MaintenanceRecord, $$MaintenanceRecordsTableReferences),
    MaintenanceRecord,
    PrefetchHooks Function({bool aquariumId})>;
typedef $$HydrobiontsTableCreateCompanionBuilder = HydrobiontsCompanion
    Function({
  required String id,
  required String aquariumId,
  required String species,
  required int quantity,
  required String action,
  required String hydrobiontType,
  required DateTime actionDate,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$HydrobiontsTableUpdateCompanionBuilder = HydrobiontsCompanion
    Function({
  Value<String> id,
  Value<String> aquariumId,
  Value<String> species,
  Value<int> quantity,
  Value<String> action,
  Value<String> hydrobiontType,
  Value<DateTime> actionDate,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$HydrobiontsTableReferences
    extends BaseReferences<_$AppDatabase, $HydrobiontsTable, Hydrobiont> {
  $$HydrobiontsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AquariumsTable _aquariumIdTable(_$AppDatabase db) =>
      db.aquariums.createAlias('hydrobionts__aquarium_id__aquariums__id');

  $$AquariumsTableProcessedTableManager get aquariumId {
    final $_column = $_itemColumn<String>('aquarium_id')!;

    final manager = $$AquariumsTableTableManager($_db, $_db.aquariums)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aquariumIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HydrobiontsTableFilterComposer
    extends Composer<_$AppDatabase, $HydrobiontsTable> {
  $$HydrobiontsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hydrobiontType => $composableBuilder(
      column: $table.hydrobiontType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  $$AquariumsTableFilterComposer get aquariumId {
    final $$AquariumsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableFilterComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HydrobiontsTableOrderingComposer
    extends Composer<_$AppDatabase, $HydrobiontsTable> {
  $$HydrobiontsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get species => $composableBuilder(
      column: $table.species, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hydrobiontType => $composableBuilder(
      column: $table.hydrobiontType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));

  $$AquariumsTableOrderingComposer get aquariumId {
    final $$AquariumsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableOrderingComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HydrobiontsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HydrobiontsTable> {
  $$HydrobiontsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get species =>
      $composableBuilder(column: $table.species, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get hydrobiontType => $composableBuilder(
      column: $table.hydrobiontType, builder: (column) => column);

  GeneratedColumn<DateTime> get actionDate => $composableBuilder(
      column: $table.actionDate, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  $$AquariumsTableAnnotationComposer get aquariumId {
    final $$AquariumsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableAnnotationComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HydrobiontsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HydrobiontsTable,
    Hydrobiont,
    $$HydrobiontsTableFilterComposer,
    $$HydrobiontsTableOrderingComposer,
    $$HydrobiontsTableAnnotationComposer,
    $$HydrobiontsTableCreateCompanionBuilder,
    $$HydrobiontsTableUpdateCompanionBuilder,
    (Hydrobiont, $$HydrobiontsTableReferences),
    Hydrobiont,
    PrefetchHooks Function({bool aquariumId})> {
  $$HydrobiontsTableTableManager(_$AppDatabase db, $HydrobiontsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HydrobiontsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HydrobiontsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HydrobiontsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> aquariumId = const Value.absent(),
            Value<String> species = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<String> hydrobiontType = const Value.absent(),
            Value<DateTime> actionDate = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HydrobiontsCompanion(
            id: id,
            aquariumId: aquariumId,
            species: species,
            quantity: quantity,
            action: action,
            hydrobiontType: hydrobiontType,
            actionDate: actionDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String aquariumId,
            required String species,
            required int quantity,
            required String action,
            required String hydrobiontType,
            required DateTime actionDate,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HydrobiontsCompanion.insert(
            id: id,
            aquariumId: aquariumId,
            species: species,
            quantity: quantity,
            action: action,
            hydrobiontType: hydrobiontType,
            actionDate: actionDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$HydrobiontsTable, Hydrobiont>(table),
                    $$HydrobiontsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({aquariumId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (aquariumId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.aquariumId,
                    referencedTable:
                        $$HydrobiontsTableReferences._aquariumIdTable(db),
                    referencedColumn:
                        $$HydrobiontsTableReferences._aquariumIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HydrobiontsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HydrobiontsTable,
    Hydrobiont,
    $$HydrobiontsTableFilterComposer,
    $$HydrobiontsTableOrderingComposer,
    $$HydrobiontsTableAnnotationComposer,
    $$HydrobiontsTableCreateCompanionBuilder,
    $$HydrobiontsTableUpdateCompanionBuilder,
    (Hydrobiont, $$HydrobiontsTableReferences),
    Hydrobiont,
    PrefetchHooks Function({bool aquariumId})>;
typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  required String id,
  required String aquariumId,
  required String content,
  required DateTime noteDate,
  required DateTime updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<String> id,
  Value<String> aquariumId,
  Value<String> content,
  Value<DateTime> noteDate,
  Value<DateTime> updatedAt,
  Value<bool> deleted,
  Value<int> rowid,
});

final class $$NotesTableReferences
    extends BaseReferences<_$AppDatabase, $NotesTable, Note> {
  $$NotesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AquariumsTable _aquariumIdTable(_$AppDatabase db) =>
      db.aquariums.createAlias('notes__aquarium_id__aquariums__id');

  $$AquariumsTableProcessedTableManager get aquariumId {
    final $_column = $_itemColumn<String>('aquarium_id')!;

    final manager = $$AquariumsTableTableManager($_db, $_db.aquariums)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_aquariumIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get noteDate => $composableBuilder(
      column: $table.noteDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnFilters(column));

  $$AquariumsTableFilterComposer get aquariumId {
    final $$AquariumsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableFilterComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get noteDate => $composableBuilder(
      column: $table.noteDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get deleted => $composableBuilder(
      column: $table.deleted, builder: (column) => ColumnOrderings(column));

  $$AquariumsTableOrderingComposer get aquariumId {
    final $$AquariumsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableOrderingComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get noteDate =>
      $composableBuilder(column: $table.noteDate, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  $$AquariumsTableAnnotationComposer get aquariumId {
    final $$AquariumsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.aquariumId,
        referencedTable: $db.aquariums,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AquariumsTableAnnotationComposer(
              $db: $db,
              $table: $db.aquariums,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$NotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, $$NotesTableReferences),
    Note,
    PrefetchHooks Function({bool aquariumId})> {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> aquariumId = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> noteDate = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            aquariumId: aquariumId,
            content: content,
            noteDate: noteDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String aquariumId,
            required String content,
            required DateTime noteDate,
            required DateTime updatedAt,
            Value<bool> deleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotesCompanion.insert(
            id: id,
            aquariumId: aquariumId,
            content: content,
            noteDate: noteDate,
            updatedAt: updatedAt,
            deleted: deleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$NotesTable, Note>(table),
                    $$NotesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({aquariumId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (aquariumId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.aquariumId,
                    referencedTable:
                        $$NotesTableReferences._aquariumIdTable(db),
                    referencedColumn:
                        $$NotesTableReferences._aquariumIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$NotesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableAnnotationComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder,
    (Note, $$NotesTableReferences),
    Note,
    PrefetchHooks Function({bool aquariumId})>;
typedef $$SyncMetaTableCreateCompanionBuilder = SyncMetaCompanion Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$SyncMetaTableUpdateCompanionBuilder = SyncMetaCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$SyncMetaTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$SyncMetaTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$SyncMetaTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetaTable> {
  $$SyncMetaTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SyncMetaTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncMetaTable,
    SyncMetaData,
    $$SyncMetaTableFilterComposer,
    $$SyncMetaTableOrderingComposer,
    $$SyncMetaTableAnnotationComposer,
    $$SyncMetaTableCreateCompanionBuilder,
    $$SyncMetaTableUpdateCompanionBuilder,
    (SyncMetaData, BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>),
    SyncMetaData,
    PrefetchHooks Function()> {
  $$SyncMetaTableTableManager(_$AppDatabase db, $SyncMetaTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetaTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetaTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetaTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncMetaCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncMetaCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SyncMetaTable, SyncMetaData>(table),
                    BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncMetaTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncMetaTable,
    SyncMetaData,
    $$SyncMetaTableFilterComposer,
    $$SyncMetaTableOrderingComposer,
    $$SyncMetaTableAnnotationComposer,
    $$SyncMetaTableCreateCompanionBuilder,
    $$SyncMetaTableUpdateCompanionBuilder,
    (SyncMetaData, BaseReferences<_$AppDatabase, $SyncMetaTable, SyncMetaData>),
    SyncMetaData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AquariumsTableTableManager get aquariums =>
      $$AquariumsTableTableManager(_db, _db.aquariums);
  $$AquariumLightsTableTableManager get aquariumLights =>
      $$AquariumLightsTableTableManager(_db, _db.aquariumLights);
  $$TestTypesTableTableManager get testTypes =>
      $$TestTypesTableTableManager(_db, _db.testTypes);
  $$WaterTestsTableTableManager get waterTests =>
      $$WaterTestsTableTableManager(_db, _db.waterTests);
  $$FertilizerTypesTableTableManager get fertilizerTypes =>
      $$FertilizerTypesTableTableManager(_db, _db.fertilizerTypes);
  $$FertilizerApplicationsTableTableManager get fertilizerApplications =>
      $$FertilizerApplicationsTableTableManager(
          _db, _db.fertilizerApplications);
  $$MaintenanceRecordsTableTableManager get maintenanceRecords =>
      $$MaintenanceRecordsTableTableManager(_db, _db.maintenanceRecords);
  $$HydrobiontsTableTableManager get hydrobionts =>
      $$HydrobiontsTableTableManager(_db, _db.hydrobionts);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$SyncMetaTableTableManager get syncMeta =>
      $$SyncMetaTableTableManager(_db, _db.syncMeta);
}

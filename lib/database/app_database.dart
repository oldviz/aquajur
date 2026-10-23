import 'package:drift/drift.dart';

// Условный импорт: для Android/iOS берётся native, для Web — web
import 'connection_native.dart'
    if (dart.library.js_interop) 'connection_web.dart';

import '../core/catalog.dart';
import '../core/util.dart';
import 'tables.dart';

part 'app_database.g.dart';

part 'db_models.dart';
part 'db_migrations.dart';
part 'db_sync.dart';
part 'db_aquariums.dart';
part 'db_lights.dart';
part 'db_tests.dart';
part 'db_fertilizers.dart';
part 'db_maintenance.dart';
part 'db_hydrobionts.dart';
part 'db_notes.dart';

@DriftDatabase(
  tables: [
    Aquariums,
    AquariumLights,
    TestTypes,
    WaterTests,
    FertilizerTypes,
    FertilizerApplications,
    MaintenanceRecords,
    Hydrobionts,
    Notes,
    SyncMeta,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await seedDefaults();
        },
        onUpgrade: (m, from, to) async {
          if (from < 6) {
            await resetSchema(m);
          }

          if (from < 7) {
            await migrateLegacyLabels();
          }

          if (from < 8) {
            await dedupeTypeNames();
          }
        },
      );
}
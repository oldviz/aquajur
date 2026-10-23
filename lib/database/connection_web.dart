import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:drift/wasm.dart';

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: 'aquarium_journal',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.js'),
    );
    
    // Извлекаем QueryExecutor из DatabaseConnection
    return result.resolvedExecutor.executor;
  });
}
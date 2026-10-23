part of 'app_database.dart';

extension NotesRepo on AppDatabase {
  Future<void> softDeleteNote(String id) =>
      (update(this.notes)..where((t) => t.id.equals(id)))
          .write(NotesCompanion(
    deleted: const Value(true),
    updatedAt: Value(DateTime.now()),
  ));

  Stream<List<Note>> watchNotes(String aquariumId) => (select(notes)
        ..where((t) => t.aquariumId.equals(aquariumId) & t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm.desc(t.noteDate)]))
      .watch();

  Future<void> saveNote(
    String aquariumId,
    String? id,
    String text,
    DateTime date,
  ) async {
    final now = DateTime.now();

    await into(notes).insert(
      NotesCompanion.insert(
        id: id ?? newId(),
        aquariumId: aquariumId,
        content: text,
        noteDate: date,
        updatedAt: now,
        deleted: const Value(false),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }
}
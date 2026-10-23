import 'package:flutter/material.dart';

import '../../database/app_database.dart';
import '../../database/tables.dart';
import '../../widgets/compact_event_tile.dart';
import '../../widgets/event_tab_view.dart';
import '../../widgets/wizard_form_sheet.dart';
import 'forms/note_form.dart';

Future<void> showNoteForm(
  BuildContext ctx,
  AppDatabase db,
  String aquariumId, {
  Note? existing,
}) async {
  await showWizardFormSheet(
    ctx,
    (context, wizard) => NoteForm(
      db: db,
      aquariumId: aquariumId,
      existing: existing,
      wizard: wizard, // Передаем контроллер волшебника
    ),
  );
}

class NotesTab extends StatelessWidget {
  final AppDatabase db;
  final String aquariumId;
  final bool showAll;
  final ValueChanged<bool> onShowAllChanged;

  const NotesTab({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.showAll,
    required this.onShowAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Note>>(
      stream: db.watchNotes(aquariumId),
      builder: (_, snapshot) {
        final items = snapshot.data ?? [];

        return EventTabView<Note>(
          items: items,
          emptyMessage: 'Заметок пока нет',
          showAll: showAll,
          onShowAllChanged: onShowAllChanged,
          getDate: (item) => item.noteDate,
          itemBuilder: (ctx, item) {
            return CompactEventTile(
              title: item.content,
              onEdit: () => showNoteForm(
                ctx,
                db,
                aquariumId,
                existing: item,
              ),
              onDelete: () => db.softDeleteNote(item.id),
            );
          },
        );
      },
    );
  }
}
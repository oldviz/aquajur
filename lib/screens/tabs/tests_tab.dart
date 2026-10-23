import 'package:flutter/material.dart';

import '../../core/catalog.dart';
import '../../database/app_database.dart';
import '../../database/tables.dart';
import '../../widgets/compact_event_tile.dart';
import '../../widgets/event_tab_view.dart';
import '../../widgets/wizard_form_sheet.dart';
import 'forms/test_form.dart';

Future<void> showTestForm(
  BuildContext ctx,
  AppDatabase db,
  String aquariumId, {
  WaterTest? existing,
  String? presetTypeId,
}) async {
  await showWizardFormSheet(
    ctx,
    (context, wizard) => TestForm(
      db: db,
      aquariumId: aquariumId,
      existing: existing,
      presetTypeId: presetTypeId,
      wizard: wizard,
    ),
  );
}

class TestsTab extends StatelessWidget {
  final AppDatabase db;
  final String aquariumId;
  final bool showAll;
  final ValueChanged<bool> onShowAllChanged;

  const TestsTab({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.showAll,
    required this.onShowAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WaterTestWithTypeName>>(
      stream: db.watchTests(aquariumId),
      builder: (_, snapshot) {
        final items = snapshot.data ?? [];

        return EventTabView<WaterTestWithTypeName>(
          items: items,
          emptyMessage: 'Тестов пока нет',
          showAll: showAll,
          onShowAllChanged: onShowAllChanged,
          getDate: (item) => item.test.testDate,
          itemBuilder: (ctx, item) {
            final parts = Catalog.splitTypeLabel(item.typeName);

            return CompactEventTile(
              leading: EventCodeLabel(text: parts.code),
              title: parts.name.isEmpty ? parts.code : parts.name,
              value: item.test.value,
              onEdit: () => showTestForm(
                ctx,
                db,
                aquariumId,
                existing: item.test,
              ),
              onDelete: () => db.softDeleteTest(item.test.id),
            );
          },
        );
      },
    );
  }
}
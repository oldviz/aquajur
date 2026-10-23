import 'package:flutter/material.dart';

import '../../core/catalog.dart';
import '../../database/app_database.dart';
import '../../database/tables.dart';
import '../../widgets/compact_event_tile.dart';
import '../../widgets/event_tab_view.dart';
import '../../widgets/wizard_form_sheet.dart';
import 'forms/fertilizer_form.dart';

Future<void> showFertilizerForm(
  BuildContext ctx,
  AppDatabase db,
  String aquariumId, {
  FertilizerApplication? existing,
}) async {
  final aquarium = await (db.select(db.aquariums)
        ..where((t) => t.id.equals(aquariumId)))
      .getSingle();

  if (!ctx.mounted) return;

  await showWizardFormSheet(
    ctx,
    (context, wizard) => FertilizerForm(
      db: db,
      aquariumId: aquariumId,
      aquariumVolume: aquarium.volume,
      existing: existing,
      wizard: wizard,
    ),
  );
}

class FertilizersTab extends StatelessWidget {
  final AppDatabase db;
  final String aquariumId;
  final bool showAll;
  final ValueChanged<bool> onShowAllChanged;

  const FertilizersTab({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.showAll,
    required this.onShowAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FertilizerApplicationWithTypeName>>(
      stream: db.watchFertilizers(aquariumId),
      builder: (_, snapshot) {
        final items = snapshot.data ?? [];

        return EventTabView<FertilizerApplicationWithTypeName>(
          items: items,
          emptyMessage: 'Удобрений пока нет',
          showAll: showAll,
          onShowAllChanged: onShowAllChanged,
          getDate: (item) => item.application.actionDate,
          itemBuilder: (ctx, item) {
            final parts = Catalog.splitTypeLabel(item.typeName);

            final value =
                '${item.application.dosage.toStringAsFixed(2)} мг/л\n(${item.application.totalAmount.toStringAsFixed(1)} всего)';

            return CompactEventTile(
              leading: EventCodeLabel(text: parts.code),
              title: parts.name.isEmpty ? parts.code : parts.name,
              value: value,
              valueStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              onEdit: () => showFertilizerForm(
                ctx,
                db,
                aquariumId,
                existing: item.application,
              ),
              onDelete: () => db.softDeleteFertilizer(item.application.id),
            );
          },
        );
      },
    );
  }
}
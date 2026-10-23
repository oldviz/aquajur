import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../database/app_database.dart';
import '../../database/tables.dart';
import '../../widgets/compact_event_tile.dart';
import '../../widgets/event_tab_view.dart';
import '../../widgets/hydrobiont_icons/hydrobiont_glyph.dart';
import '../../widgets/wizard_form_sheet.dart';
import 'forms/hydrobiont_form.dart';

Future<void> showHydrobiontForm(
  BuildContext ctx,
  AppDatabase db,
  String aquariumId, {
  Hydrobiont? existing,
}) async {
  await showWizardFormSheet(
    ctx,
    (context, wizard) => HydrobiontForm(
      db: db,
      aquariumId: aquariumId,
      existing: existing,
      wizard: wizard,
    ),
  );
}

class HydrobiontsTab extends StatelessWidget {
  final AppDatabase db;
  final String aquariumId;
  final bool showAll;
  final ValueChanged<bool> onShowAllChanged;

  const HydrobiontsTab({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.showAll,
    required this.onShowAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Hydrobiont>>(
      stream: db.watchHydrobionts(aquariumId),
      builder: (_, snapshot) {
        final items = snapshot.data ?? [];

        return EventTabView<Hydrobiont>(
          items: items,
          emptyMessage: 'Записей пока нет',
          showAll: showAll,
          onShowAllChanged: onShowAllChanged,
          getDate: (item) => item.actionDate,
          itemBuilder: (ctx, item) {
            final added = item.action == 'added';
            final color = added ? AppColors.positive : AppColors.negative;

            return CompactEventTile(
              leading: HydrobiontGlyph(
                type: item.hydrobiontType,
                color: color,
                size: 28,
              ),
              title: item.species,
              value: item.quantity.toString(),
              onEdit: () => showHydrobiontForm(
                ctx,
                db,
                aquariumId,
                existing: item,
              ),
              onDelete: () => db.softDeleteHydrobiont(item.id),
            );
          },
        );
      },
    );
  }
}
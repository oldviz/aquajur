import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/catalog.dart';
import '../../database/app_database.dart';
import '../../database/tables.dart';
import '../../widgets/compact_event_tile.dart';
import '../../widgets/event_tab_view.dart';
import '../../widgets/wizard_form_sheet.dart';
import 'forms/maintenance_form.dart';

Future<void> showMaintenanceForm(
  BuildContext ctx,
  AppDatabase db,
  String aquariumId, {
  MaintenanceRecord? existing,
}) async {
  await showWizardFormSheet(
    ctx,
    (context, wizard) => MaintenanceForm(
      db: db,
      aquariumId: aquariumId,
      existing: existing,
      wizard: wizard,
    ),
  );
}

class MaintenanceTab extends StatelessWidget {
  final AppDatabase db;
  final String aquariumId;
  final bool showAll;
  final ValueChanged<bool> onShowAllChanged;

  const MaintenanceTab({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.showAll,
    required this.onShowAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MaintenanceRecord>>(
      stream: db.watchMaintenance(aquariumId),
      builder: (_, snapshot) {
        final items = snapshot.data ?? [];

        return EventTabView<MaintenanceRecord>(
          items: items,
          emptyMessage: 'Записей обслуживания нет',
          showAll: showAll,
          onShowAllChanged: onShowAllChanged,
          getDate: (item) => item.actionDate,
          itemBuilder: (ctx, item) {
            final showAmount = Catalog.isWaterChange(item.maintenanceType);

            return CompactEventTile(
              leading: Icon(
                Catalog.maintenanceIcon(item.maintenanceType),
                color: AppColors.accent,
              ),
              title: item.maintenanceType,
              value: showAmount ? '${item.volumeOrAmount} л' : null,
              onEdit: () => showMaintenanceForm(
                ctx,
                db,
                aquariumId,
                existing: item,
              ),
              onDelete: () => db.softDeleteMaintenance(item.id),
            );
          },
        );
      },
    );
  }
}
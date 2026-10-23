import 'package:flutter/material.dart';

import '../database/app_database.dart';
import '../widgets/aquarium_header.dart';
import 'aquarium_form_screen.dart';
import 'settings_screen.dart';
import 'tabs/tests_tab.dart';
import 'tabs/fertilizers_tab.dart';
import 'tabs/maintenance_tab.dart';
import 'tabs/hydrobionts_tab.dart';
import 'tabs/notes_tab.dart';

class AquariumDetailScreen extends StatefulWidget {
  final AppDatabase db;
  final Aquarium aquarium;

  const AquariumDetailScreen({
    super.key,
    required this.db,
    required this.aquarium,
  });

  @override
  State<AquariumDetailScreen> createState() => _AquariumDetailScreenState();
}

class _AquariumDetailScreenState extends State<AquariumDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool _showAll = false;
  late Aquarium _currentAquarium;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _currentAquarium = widget.aquarium;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onShowAllChanged(bool v) => setState(() => _showAll = v);

  void _handleSettings() => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SettingsScreen(db: widget.db)),
      );

  Future<void> _confirmDelete() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить аквариум?'),
        content: const Text('Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      await widget.db.deleteAquarium(_currentAquarium.id);
      if (mounted) Navigator.pop(context);
    }
  }

  Future<void> _handleEdit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AquariumFormScreen(
          db: widget.db,
          aquarium: _currentAquarium,
        ),
      ),
    );

    if (result is Aquarium && mounted) {
      setState(() => _currentAquarium = result);
    }
  }

  void _handleFabPress() {
    switch (_tabController.index) {
      case 0:
        showTestForm(context, widget.db, _currentAquarium.id);
        break;
      case 1:
        showFertilizerForm(context, widget.db, _currentAquarium.id);
        break;
      case 2:
        showMaintenanceForm(context, widget.db, _currentAquarium.id);
        break;
      case 3:
        showHydrobiontForm(context, widget.db, _currentAquarium.id);
        break;
      case 4:
        showNoteForm(context, widget.db, _currentAquarium.id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation:
          const _FixedEndFabLocation(bottomMargin: 24),

      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            AquariumHeader(
              aquarium: _currentAquarium,
              onBack: () => Navigator.pop(context),
              onEdit: _handleEdit,
              onDelete: _confirmDelete,
              onSettings: _handleSettings,
            ),
            
            // ИСПРАВЛЕНО: Фон таба теперь точно такой же, как у шапки (surface)
            Container(
              color: colorScheme.surface, 
              child: TabBar(
                controller: _tabController,
                indicatorColor: colorScheme.primary,
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurfaceVariant,
                indicatorWeight: 3,
                labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                labelStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: const TextStyle(fontSize: 11),
                tabs: const [
                  Tab(text: 'Тесты'),
                  Tab(text: 'УДО'),
                  Tab(text: 'Обслуж.'),
                  Tab(text: 'Обитатели'),
                  Tab(text: 'Заметки'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  TestsTab(
                    db: widget.db,
                    aquariumId: _currentAquarium.id,
                    showAll: _showAll,
                    onShowAllChanged: _onShowAllChanged,
                  ),
                  FertilizersTab(
                    db: widget.db,
                    aquariumId: _currentAquarium.id,
                    showAll: _showAll,
                    onShowAllChanged: _onShowAllChanged,
                  ),
                  MaintenanceTab(
                    db: widget.db,
                    aquariumId: _currentAquarium.id,
                    showAll: _showAll,
                    onShowAllChanged: _onShowAllChanged,
                  ),
                  HydrobiontsTab(
                    db: widget.db,
                    aquariumId: _currentAquarium.id,
                    showAll: _showAll,
                    onShowAllChanged: _onShowAllChanged,
                  ),
                  NotesTab(
                    db: widget.db,
                    aquariumId: _currentAquarium.id,
                    showAll: _showAll,
                    onShowAllChanged: _onShowAllChanged,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleFabPress,
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Фиксированное расположение кнопки +.
class _FixedEndFabLocation extends FloatingActionButtonLocation {
  final double bottomMargin;
  final double rightMargin;

  const _FixedEndFabLocation({
    this.bottomMargin = 24,
    this.rightMargin = 16,
  });

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final fabSize = scaffoldGeometry.floatingActionButtonSize;

    final dx = scaffoldGeometry.scaffoldSize.width - fabSize.width - rightMargin;
    final dy = scaffoldGeometry.scaffoldSize.height - fabSize.height - bottomMargin;

    return Offset(dx, dy);
  }

  @override
  String toString() {
    return '_FixedEndFabLocation(bottomMargin: $bottomMargin, rightMargin: $rightMargin)';
  }
}
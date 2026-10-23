import 'package:flutter/material.dart';

import '../database/app_database.dart';
import '../services/ui_refresh_signal.dart';
import 'aquarium_detail_screen.dart';
import 'settings_screen.dart';
import 'aquarium_form_screen.dart';

class HomeScreen extends StatefulWidget {
  final AppDatabase db;

  const HomeScreen({super.key, required this.db});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои аквариумы'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(db: widget.db),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AquariumFormScreen(db: widget.db),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    // Слушаем сигнал обновления после импорта JSON
    return AnimatedBuilder(
      animation: UiRefreshSignal.instance,
      builder: (context, _) {
        return StreamBuilder<List<AquariumTileData>>(
          stream: widget.db.watchTiles(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final tiles = snapshot.data ?? [];

            if (tiles.isEmpty) {
              return const Center(
                child: Text(
                  'Пока нет аквариумов.\nНажмите +, чтобы добавить первый.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.95,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: tiles.length,
              itemBuilder: (_, index) {
                final tile = tiles[index];
                final aquarium = tile.aquarium;
                final colorScheme = Theme.of(context).colorScheme;

                return Card(
                  margin: EdgeInsets.zero,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => AquariumDetailScreen(
                            db: widget.db,
                            aquarium: aquarium,
                          ),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Название аквариума
                          Text(
                            aquarium.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),

                          const SizedBox(height: 4),

                          // Литраж крупно и бирюзовым
                          Text(
                            '${aquarium.volume} л',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                              height: 1.0,
                            ),
                          ),

                          const SizedBox(height: 2),

                          // Размеры мелко
                          Text(
                            '${_fmtNum(aquarium.lengthCm)}×'
                            '${_fmtNum(aquarium.widthCm)}×'
                            '${_fmtNum(aquarium.heightCm)} см',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),

                          const Spacer(),

                          // Дата запуска
                          Row(
                            children: [
                              Icon(
                                Icons.play_circle_outline,
                                size: 12,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  aquarium.launchDate != null
                                      ? 'Запуск: ${_formatShortDate(aquarium.launchDate!)}'
                                      : 'Запуск: не указан',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 2),

                          // Последняя активность
                          Row(
                            children: [
                              Icon(
                                Icons.history,
                                size: 12,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  tile.lastActivity != null
                                      ? 'Актив.: ${_formatShortDate(tile.lastActivity!)}'
                                      : 'Нет активности',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  String _fmtNum(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toStringAsFixed(1);
  }

  String _formatShortDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }
}
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

            // Оригинальная сетка плиток
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85, // Чуть выше, чем квадрат, для размещения данных
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
                          // Верхняя часть: Иконка/Аватар и Название
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: colorScheme.primaryContainer,
                                foregroundColor: colorScheme.onPrimaryContainer,
                                child: Text(
                                  '${aquarium.volume}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  aquarium.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          // Нижняя часть: Дата запуска или активность
                          if (tile.lastActivity != null)
                            Text(
                              'Актив.: ${_formatShortDate(tile.lastActivity!)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            )
                          else if (aquarium.launchDate != null)
                            Text(
                              'Запущен: ${_formatShortDate(aquarium.launchDate!)}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            )
                          else
                            Text(
                              'Нет данных',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11,
                                color: colorScheme.onSurfaceVariant,
                              ),
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

  String _formatShortDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }
}
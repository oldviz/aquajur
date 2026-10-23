import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../core/util.dart';
import '../database/app_database.dart';

class AquariumTile extends StatelessWidget {
  final AquariumTileData data;
  final VoidCallback onTap;
  // Параметр onEdit больше не нужен
  const AquariumTile({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final a = data.aquarium;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                const Icon(Icons.waves, color: Color(0xFF4DD0E1), size: 28),
                const SizedBox(width: 6),
                Expanded(child: Text(a.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15))),
              ]),
              const SizedBox(height: 4),
              Text('${a.volume} л', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF4DD0E1))),
              const SizedBox(height: 2),
              Text('${fmtNum(a.lengthCm)}×${fmtNum(a.widthCm)}×${fmtNum(a.heightCm)} см',
                  style: const TextStyle(color: Colors.white70, fontSize: 12)),
              if (a.launchDate != null) ...[
                const SizedBox(height: 2),
                Text('запущен ${DateFormat('dd.MM.yy').format(a.launchDate!)}',
                    style: const TextStyle(color: Colors.white54, fontSize: 11)),
              ],
              const Spacer(),
              if (data.lastActivity != null)
                Text('изменено ${DateFormat('dd.MM.yy HH:mm').format(data.lastActivity!)}',
                    style: const TextStyle(color: Colors.white38, fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
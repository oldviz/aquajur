import 'package:flutter/material.dart';

import 'fish_painter.dart';
import 'plant_painter.dart';
import 'shrimp_painter.dart';
import 'snail_painter.dart';
import 'paw_painter.dart';

/// Монохромная векторная иконка обитателя.
class HydrobiontGlyph extends StatelessWidget {
  final String type;
  final Color color;
  final double size;

  const HydrobiontGlyph({
    super.key,
    required this.type,
    required this.color,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        size: Size(size, size),
        painter: _painterFor(type, color),
      ),
    );
  }
}

CustomPainter _painterFor(String type, Color color) {
  if (type.contains('Рыб')) return FishPainter(color);

  if (type.contains('Растен')) return PlantPainter(color);

  if (type.contains('Ракообраз') ||
      type.contains('Краб') ||
      type.contains('Креветк')) {
    return ShrimpPainter(color);
  }

  if (type.contains('Моллюск') || type.contains('Улитк')) {
    return SnailPainter(color);
  }

  return PawPainter(color);
}
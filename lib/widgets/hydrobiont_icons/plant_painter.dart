import 'dart:math' as math;

import 'package:flutter/material.dart';

class PlantPainter extends CustomPainter {
  final Color color;

  PlantPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final stem = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.075
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Стебель
    canvas.drawLine(
      Offset(w * 0.50, h * 0.84),
      Offset(w * 0.50, h * 0.98),
      stem,
    );

    final base = Offset(w * 0.50, h * 0.86);

    // Несколько узких листьев веером
    final leaves = <({Offset tip, double side})>[
      (tip: Offset(w * 0.08, h * 0.58), side: w * 0.055),
      (tip: Offset(w * 0.24, h * 0.26), side: w * 0.065),
      (tip: Offset(w * 0.50, h * 0.08), side: w * 0.075),
      (tip: Offset(w * 0.76, h * 0.26), side: w * 0.065),
      (tip: Offset(w * 0.92, h * 0.58), side: w * 0.055),
    ];

    for (final leaf in leaves) {
      canvas.drawPath(_leafPath(base, leaf.tip, leaf.side), fill);
    }
  }

  Path _leafPath(Offset base, Offset tip, double side) {
    final dx = tip.dx - base.dx;
    final dy = tip.dy - base.dy;
    final len = math.sqrt(dx * dx + dy * dy);

    if (len == 0) return Path();

    // Перпендикуляр к направлению листа
    final nx = -dy / len;
    final ny = dx / len;

    Offset point(double t, double offset) {
      return Offset(
        base.dx + dx * t + nx * offset,
        base.dy + dy * t + ny * offset,
      );
    }

    return Path()
      ..moveTo(base.dx, base.dy)
      ..cubicTo(
        point(0.32, side).dx,
        point(0.32, side).dy,
        point(0.72, side * 0.42).dx,
        point(0.72, side * 0.42).dy,
        tip.dx,
        tip.dy,
      )
      ..cubicTo(
        point(0.72, -side * 0.42).dx,
        point(0.72, -side * 0.42).dy,
        point(0.32, -side).dx,
        point(0.32, -side).dy,
        base.dx,
        base.dy,
      )
      ..close();
  }

  @override
  bool shouldRepaint(covariant PlantPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
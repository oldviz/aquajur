import 'dart:math' as math;

import 'package:flutter/material.dart';

class SnailPainter extends CustomPainter {
  final Color color;

  SnailPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final thinStroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    // Тело улитки
    final body = Path()
      ..moveTo(w * 0.08, h * 0.84)
      ..lineTo(w * 0.92, h * 0.84)
      ..lineTo(w * 0.92, h * 0.72)
      ..lineTo(w * 0.38, h * 0.72)
      ..cubicTo(w * 0.22, h * 0.72, w * 0.12, h * 0.78, w * 0.08, h * 0.84)
      ..close();

    canvas.drawPath(body, fill);

    // Голова
    canvas.drawCircle(
      Offset(w * 0.88, h * 0.66),
      w * 0.09,
      fill,
    );

    // Глазные щупальца
    canvas.drawLine(
      Offset(w * 0.88, h * 0.66),
      Offset(w * 0.94, h * 0.44),
      thinStroke,
    );
    canvas.drawLine(
      Offset(w * 0.84, h * 0.66),
      Offset(w * 0.78, h * 0.44),
      thinStroke,
    );

    canvas.drawCircle(
      Offset(w * 0.94, h * 0.42),
      w * 0.03,
      fill,
    );
    canvas.drawCircle(
      Offset(w * 0.78, h * 0.42),
      w * 0.03,
      fill,
    );

    // Раковина
    final center = Offset(w * 0.46, h * 0.42);
    final radius = w * 0.30;

    canvas.saveLayer(null, Paint());
    canvas.drawCircle(center, radius, fill);

    // Спираль внутри раковины вырезаем прозрачностью.
    final clearStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.055
      ..strokeCap = StrokeCap.round
      ..blendMode = BlendMode.clear
      ..isAntiAlias = true;

    final arcs = <({Rect rect, double start, double sweep})>[
      (
        rect: Rect.fromCircle(center: center, radius: radius * 0.28),
        start: 0,
        sweep: math.pi,
      ),
      (
        rect: Rect.fromCircle(
          center: Offset(center.dx - radius * 0.08, center.dy - radius * 0.08),
          radius: radius * 0.52,
        ),
        start: math.pi,
        sweep: math.pi,
      ),
      (
        rect: Rect.fromCircle(
          center: Offset(center.dx + radius * 0.08, center.dy + radius * 0.04),
          radius: radius * 0.76,
        ),
        start: 0,
        sweep: math.pi,
      ),
      (
        rect: Rect.fromCircle(
          center: Offset(center.dx - radius * 0.04, center.dy + radius * 0.08),
          radius: radius * 0.94,
        ),
        start: math.pi,
        sweep: math.pi,
      ),
    ];

    for (final arc in arcs) {
      final path = Path()..addArc(arc.rect, arc.start, arc.sweep);
      canvas.drawPath(path, clearStroke);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant SnailPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
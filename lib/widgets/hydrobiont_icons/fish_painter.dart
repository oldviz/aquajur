import 'package:flutter/material.dart';

class FishPainter extends CustomPainter {
  final Color color;

  FishPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final body = Path()
      ..moveTo(w * 0.22, h * 0.50)
      ..cubicTo(w * 0.36, h * 0.25, w * 0.72, h * 0.25, w * 0.86, h * 0.50)
      ..cubicTo(w * 0.72, h * 0.75, w * 0.36, h * 0.75, w * 0.22, h * 0.50)
      ..close();

    final tail = Path()
      ..moveTo(w * 0.22, h * 0.50)
      ..lineTo(w * 0.04, h * 0.28)
      ..lineTo(w * 0.13, h * 0.50)
      ..lineTo(w * 0.04, h * 0.72)
      ..close();

    final dorsalFin = Path()
      ..moveTo(w * 0.46, h * 0.31)
      ..lineTo(w * 0.57, h * 0.14)
      ..lineTo(w * 0.66, h * 0.31)
      ..close();

    canvas.saveLayer(null, Paint());

    canvas.drawPath(body, fill);
    canvas.drawPath(tail, fill);
    canvas.drawPath(dorsalFin, fill);

    // Вырезаем глаз, чтобы иконка оставалась монохромной.
    final eyeCut = Paint()
      ..blendMode = BlendMode.clear
      ..isAntiAlias = true;

    canvas.drawCircle(
      Offset(w * 0.74, h * 0.43),
      w * 0.055,
      eyeCut,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant FishPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
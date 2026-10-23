import 'package:flutter/material.dart';

class PawPainter extends CustomPainter {
  final Color color;

  PawPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Основная подушечка.
    canvas.drawCircle(
      Offset(w * 0.50, h * 0.62),
      w * 0.22,
      fill,
    );

    // Пальцы.
    canvas.drawCircle(Offset(w * 0.28, h * 0.36), w * 0.10, fill);
    canvas.drawCircle(Offset(w * 0.46, h * 0.26), w * 0.10, fill);
    canvas.drawCircle(Offset(w * 0.64, h * 0.28), w * 0.10, fill);
    canvas.drawCircle(Offset(w * 0.78, h * 0.42), w * 0.10, fill);
  }

  @override
  bool shouldRepaint(covariant PawPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
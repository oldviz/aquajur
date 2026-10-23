import 'package:flutter/material.dart';

class ShrimpPainter extends CustomPainter {
  final Color color;

  ShrimpPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final bodyStroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.20
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final thinStroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.042
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final clearStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.038
      ..strokeCap = StrokeCap.round
      ..blendMode = BlendMode.clear
      ..isAntiAlias = true;

    final clearFill = Paint()
      ..blendMode = BlendMode.clear
      ..isAntiAlias = true;

    // Основной слой: тело, голова, хвост, затем вырезаем глаз и сегменты.
    canvas.saveLayer(null, Paint());

    // Изогнутое тело креветки.
    final body = Path()
      ..moveTo(w * 0.32, h * 0.68)
      ..cubicTo(
        w * 0.38,
        h * 0.38,
        w * 0.62,
        h * 0.24,
        w * 0.74,
        h * 0.32,
      );

    canvas.drawPath(body, bodyStroke);

    // Голова.
    canvas.drawCircle(
      Offset(w * 0.76, h * 0.30),
      w * 0.125,
      fill,
    );

    // Хвостовой веер слева.
    final tailBase = Offset(w * 0.31, h * 0.67);

    canvas.drawPath(
      Path()
        ..moveTo(tailBase.dx, tailBase.dy)
        ..lineTo(w * 0.08, h * 0.48)
        ..lineTo(w * 0.22, h * 0.64)
        ..close(),
      fill,
    );

    canvas.drawPath(
      Path()
        ..moveTo(tailBase.dx, tailBase.dy)
        ..lineTo(w * 0.03, h * 0.67)
        ..lineTo(w * 0.21, h * 0.71)
        ..close(),
      fill,
    );

    canvas.drawPath(
      Path()
        ..moveTo(tailBase.dx, tailBase.dy)
        ..lineTo(w * 0.11, h * 0.88)
        ..lineTo(w * 0.25, h * 0.72)
        ..close(),
      fill,
    );

    // Глаз — вырезаем, чтобы иконка осталась монохромной.
    canvas.drawCircle(
      Offset(w * 0.80, h * 0.26),
      w * 0.032,
      clearFill,
    );

    // Небольшие сегменты на теле.
    canvas.drawLine(
      Offset(w * 0.62, h * 0.30),
      Offset(w * 0.58, h * 0.50),
      clearStroke,
    );

    canvas.drawLine(
      Offset(w * 0.52, h * 0.38),
      Offset(w * 0.48, h * 0.58),
      clearStroke,
    );

    canvas.drawLine(
      Offset(w * 0.42, h * 0.50),
      Offset(w * 0.39, h * 0.68),
      clearStroke,
    );

    canvas.restore();

    // Рострум — острый «нос» креветки.
    canvas.drawPath(
      Path()
        ..moveTo(w * 0.82, h * 0.20)
        ..lineTo(w * 0.99, h * 0.06)
        ..lineTo(w * 0.86, h * 0.32)
        ..close(),
      fill,
    );

    // Усы.
    canvas.drawLine(
      Offset(w * 0.86, h * 0.18),
      Offset(w * 0.99, h * 0.02),
      thinStroke,
    );

    canvas.drawLine(
      Offset(w * 0.88, h * 0.26),
      Offset(w * 0.99, h * 0.14),
      thinStroke,
    );

    // Лапки.
    canvas.drawLine(
      Offset(w * 0.66, h * 0.42),
      Offset(w * 0.62, h * 0.60),
      thinStroke,
    );

    canvas.drawLine(
      Offset(w * 0.56, h * 0.52),
      Offset(w * 0.52, h * 0.70),
      thinStroke,
    );

    canvas.drawLine(
      Offset(w * 0.46, h * 0.60),
      Offset(w * 0.42, h * 0.78),
      thinStroke,
    );

    canvas.drawLine(
      Offset(w * 0.38, h * 0.66),
      Offset(w * 0.34, h * 0.84),
      thinStroke,
    );
  }

  @override
  bool shouldRepaint(covariant ShrimpPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
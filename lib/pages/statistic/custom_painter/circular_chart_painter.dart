import 'dart:math';

import 'package:flutter/material.dart';

class CircularChartPainter extends CustomPainter {
  final List<double> categoryPercentages;
  final List<Color> categoryColors;
  final double animationValue;

  CircularChartPainter(
      this.categoryPercentages, this.categoryColors, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    double startAngle = -pi / 2;
    double total = categoryPercentages.reduce((a, b) => a + b);

    for (int i = 0; i < categoryPercentages.length; i++) {
      double sweepAngle =
          (categoryPercentages[i] / total) * 2 * pi * animationValue;
      paint.color = categoryColors[i];
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: 80),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


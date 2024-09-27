import 'package:flutter/material.dart';

import '../../../utils/theme/app_color.dart';

class AnimatedBarChartPainter extends CustomPainter {
  final List<double> incomeData;
  final List<double> expenseData;
  final double maxBarHeight = 200.0;
  final double animationValue;
  final double barOffsetFromZero = 20.0;
  AnimatedBarChartPainter({
    required this.incomeData,
    required this.expenseData,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint barPaint = Paint()..style = PaintingStyle.fill;
    Paint gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1.0;

    double barWidth = 20.0;
    double spaceBetweenBars = 6.0;
    double spaceBetweenBarSets = 60.0;
    double startingOffset = 70.0;
    double borderRadius = 4.0;
    drawDashedGridLines(canvas, size, gridPaint);

    for (int i = 0; i < incomeData.length; i++) {
      barPaint.color = AppColor.green;
      double incomeBarHeight =
          (incomeData[i] / 5000) * maxBarHeight * animationValue;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            startingOffset +
                i * (barWidth + spaceBetweenBars + spaceBetweenBarSets),
            maxBarHeight - incomeBarHeight,
            barWidth,
            incomeBarHeight + barOffsetFromZero,
          ),
          Radius.circular(borderRadius),
        ),
        barPaint,
      );

      barPaint.color = AppColor.secondary;
      double expenseBarHeight =
          (expenseData[i] / 5000) * maxBarHeight * animationValue;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            startingOffset +
                i * (barWidth + spaceBetweenBars + spaceBetweenBarSets) +
                barWidth +
                spaceBetweenBars,
            maxBarHeight - expenseBarHeight,
            barWidth,
            expenseBarHeight + barOffsetFromZero,
          ),
          Radius.circular(borderRadius),
        ),
        barPaint,
      );
    }

    drawWeekLabels(canvas, size, startingOffset, spaceBetweenBarSets, barWidth,
        spaceBetweenBars);
  }

  void drawDashedGridLines(Canvas canvas, Size size, Paint gridPaint) {
    double gridSpacing = maxBarHeight / 5;
    double dashWidth = 10;
    double dashSpace = 10;
    double dashOffset = 30;

    for (int i = 0; i <= 5; i++) {
      double y = maxBarHeight - (i * gridSpacing);

      for (double x = dashOffset; x < size.width; x += dashWidth + dashSpace) {
        canvas.drawLine(Offset(x, y), Offset(x + dashWidth, y), gridPaint);
      }

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: '\$${i * 1}k',
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14, color: AppColor.gray),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(0, y - 7));
    }
  }

  void drawWeekLabels(Canvas canvas, Size size, double startingOffset,
      double spaceBetweenBarSets, double barWidth, double spaceBetweenBars) {
    List<String> weeks = ['Week 1', 'Week 2', 'Week 3', 'Week 4'];

    for (int i = 0; i < weeks.length; i++) {
      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: weeks[i],
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14, color: AppColor.gray),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      double xPosition = startingOffset +
          i * (barWidth + spaceBetweenBars + spaceBetweenBarSets);
      textPainter.paint(
          canvas, Offset(xPosition, maxBarHeight + 10 + barOffsetFromZero));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

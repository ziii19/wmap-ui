import 'package:flutter/material.dart';

class LineGradient extends StatelessWidget {
  final Color color;
  final double? width;
  const LineGradient({
    super.key,
    required this.color,
    this.width = .5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0),
            color,
            color.withOpacity(0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

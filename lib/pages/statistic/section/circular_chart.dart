import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/assets_svg.dart';
import '../../../utils/theme/app_color.dart';
import '../custom_painter/circular_chart_painter.dart';

class CircularChart extends StatefulWidget {
  const CircularChart({super.key});

  @override
  State<CircularChart> createState() => _CircularChartState();
}

class _CircularChartState extends State<CircularChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<String> categoryLabels = ['Transportation', 'Shopping', 'Coffee'];
  final List<double> categoryPercentages = [20, 20, 50];
  final List<Color> categoryColors = [
    AppColor.secondary,
    AppColor.green,
    AppColor.primary
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category Chart',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20),
                ),
                Text(
                  'Last 7 days expenses',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                '\$312.00',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(200, 200),
                    painter: CircularChartPainter(
                        categoryPercentages, categoryColors, _animation.value),
                  ),
                  SvgPicture.asset(AssetsSvg.coffe)
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (i) => Padding(
              padding: EdgeInsets.only(right: i == 2 ? 0 : 32.0),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: categoryColors[i],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    categoryLabels[i],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          color: categoryColors[i],
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

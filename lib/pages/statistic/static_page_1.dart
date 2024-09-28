import 'package:flutter/material.dart';
import 'package:wpay/utils/constants/assets_svg.dart';
import 'package:wpay/utils/theme/app_color.dart';
import 'package:wpay/widgets/custom_app_bar.dart';
import 'package:wpay/widgets/icon_wrap.dart';
import 'package:wpay/widgets/line_gradient.dart';

import 'custom_painter/bar_chart_painter.dart';
import 'section/circular_chart.dart';
import 'section/recent_expenses.dart';

part 'section/2/statistic_info.dart';
part 'section/2/bar_chart.dart';

class StatisticPage1 extends StatelessWidget {
  const StatisticPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  leading: IconWrap(icon: AssetsSvg.arrowBack),
                  title: 'Statistic',
                  actions: [
                    IconWrap(icon: AssetsSvg.setting),
                  ],
                ),
                SizedBox(height: 24),
                _StatisticInfo1(),
                SizedBox(height: 24),
                _BarChart(),
                SizedBox(height: 20),
                CircularChart(),
                SizedBox(height: 24),
                RecentExspenses(),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

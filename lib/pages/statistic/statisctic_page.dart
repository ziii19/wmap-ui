import 'package:flutter/material.dart';
import 'package:wpay/pages/statistic/section/recent_expenses.dart';
import 'package:wpay/utils/constants/assets_svg.dart';
import 'package:wpay/widgets/custom_app_bar.dart';
import 'package:wpay/widgets/icon_wrap.dart';
import 'package:wpay/widgets/line_gradient.dart';

import '../../utils/theme/app_color.dart';
import 'section/circular_chart.dart';

part 'section/1/statistic_info.dart';
part 'section/1/statistic_bar.dart';
part 'section/1/category_button.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

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
                  actions: IconWrap(icon: AssetsSvg.setting),
                ),
                SizedBox(height: 24),
                _StatisticInfo(),
                SizedBox(height: 24),
                _StatisticBar(),
                SizedBox(height: 32),
                _CategoryButton(),
                SizedBox(height: 20),
                SizedBox(height: 10),
                CircularChart(),
                SizedBox(height: 20),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wpay/utils/constants/assets_svg.dart';
import 'package:wpay/widgets/icon_wrap.dart';

import '../../utils/theme/app_color.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/line_gradient.dart';

part 'section/main_menu_section.dart';
part 'section/discount.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CustomAppBar(
              leading: SvgPicture.asset(
                AssetsSvg.logo,
                height: 38,
              ),
              actions: const IconWrap(
                icon: AssetsSvg.setting,
                color: AppColor.black,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Andre,',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Your available balance',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                Text(
                  '\$15,901',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
            const SizedBox(height: 24),
            const _MainMenu(),
            const SizedBox(height: 24),
            Text(
              'Payment List',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                double itemWidth = constraints.maxWidth / 4; // 4 item per baris
                double itemHeight = 116; // Tentukan tinggi item yang diinginkan
                double childAspectRatio = itemWidth / itemHeight;

                return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  // mainAxisSpacing: 16,
                  childAspectRatio: childAspectRatio,
                  children: [
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.electricity,
                      title: 'Electricity',
                    ),
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.internet,
                      title: 'Internet',
                    ),
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.voucher,
                      title: 'Voucher',
                    ),
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.asurance,
                      title: 'Assurance',
                    ),
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.merchant,
                      title: 'Merchant',
                    ),
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.mobileCredit,
                      title: 'Mobile\nCredit',
                    ),
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.bill,
                      title: 'Bill',
                    ),
                    _buildPaymentItem(
                      context,
                      icon: AssetsSvg.more,
                      title: 'More',
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Promo & Discount',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'See All',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColor.green,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _Discount1(),
                  SizedBox(width: 16),
                  _Discount2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildPaymentItem(
    BuildContext context, {
    required String icon,
    required String title,
  }) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.white1,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Flexible(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

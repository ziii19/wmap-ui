import 'package:flutter/material.dart';

import '../../../utils/constants/assets_svg.dart';
import '../../../utils/theme/app_color.dart';
import '../../notification/widgets/notification_icon.dart';

class RecentExspenses extends StatelessWidget {
  const RecentExspenses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Expenses',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 16),
        Column(
          children: List.generate(
            3,
            (i) => Container(
              margin: EdgeInsets.only(bottom: i == 2 ? 0 : 23),
              width: double.infinity,
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NotificationIcon(
                    bgColor: i % 2 == 0 ? AppColor.primary : AppColor.black,
                    icon: i % 2 == 0 ? AssetsSvg.discount : AssetsSvg.today,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          i % 2 == 0
                              ? 'Starbucks Coffee'
                              : 'Netflix Subscription',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 16),
                        ),
                        Text(
                          i % 2 == 0
                              ? 'Dec 2, 2020  •  3:09 PM'
                              : 'Dec 11, 2020  •  10:02 AM',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      i % 2 == 0 ? '-\$156.00' : '-\$87.00',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

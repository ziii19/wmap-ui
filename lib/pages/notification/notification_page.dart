import 'package:flutter/material.dart';
import 'package:wpay/pages/notification/widgets/notification_icon.dart';
import 'package:wpay/utils/theme/app_color.dart';
import 'package:wpay/widgets/custom_app_bar.dart';
import 'package:wpay/widgets/icon_wrap.dart';

import '../../utils/constants/assets_svg.dart';

part 'section/notification_list_category.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              color: AppColor.primary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomAppBar(
              leading: IconWrap(
                icon: AssetsSvg.arrowBack,
                color: AppColor.white,
              ),
              title: 'Notification',
              titleColor: AppColor.white,
              actions: [
                IconWrap(
                  icon: AssetsSvg.setting,
                  color: AppColor.white,
                ),
              ],
            ),
          ),
          ListView(
            children: [
              const SizedBox(height: 90),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: AppColor.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColor.gray,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'TODAY',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Mark as read',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.green,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 96,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.green.withOpacity(.10),
                      ),
                      child: Row(
                        children: [
                          const NotificationIcon(
                            icon: AssetsSvg.discount,
                            bgColor: AppColor.green,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cashback 50%',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 16),
                              ),
                              Text(
                                'Get 50% cashback for the next top up',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Top up now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                          color: AppColor.green,
                                        ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: AppColor.green,
                                    size: 16,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const _NotificationListCategory(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

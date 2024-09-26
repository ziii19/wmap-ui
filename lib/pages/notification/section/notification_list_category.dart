part of '../notification_page.dart';

class _NotificationListCategory extends StatelessWidget {
  const _NotificationListCategory();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'YESTERDAY',
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Column(
          children: List.generate(
              4,
              (i) => Container(
                    margin: EdgeInsets.only(bottom: i == 3 ? 0 : 23),
                    width: double.infinity,
                    height: 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NotificationIcon(
                          bgColor:
                              i % 2 == 1 ? AppColor.green : AppColor.secondary,
                          icon:
                              i % 2 == 1 ? AssetsSvg.discount : AssetsSvg.today,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                i % 2 == 1
                                    ? '30% Black Friday Deal'
                                    : 'Daily Cashback',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 16),
                              ),
                              Text(
                                i % 2 == 1 ? '3:40 PM' : '8:00 AM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 53,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.green.withOpacity(.09),
                          ),
                          child: Center(
                            child: Text(
                              'Promo',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 12,
                                    color: AppColor.green,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
        ),
        const SizedBox(height: 24),
        Text(
          'LAST 7 DAY',
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Column(
          children: List.generate(
              3,
              (i) => Container(
                    margin: EdgeInsets.only(bottom: i == 2 ? 0 : 23),
                    width: double.infinity,
                    height: 48,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NotificationIcon(
                          bgColor:
                              i % 2 == 1 ? AppColor.green : AppColor.secondary,
                          icon:
                              i % 2 == 1 ? AssetsSvg.discount : AssetsSvg.today,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                i % 2 == 1
                                    ? '30% Black Friday Deal'
                                    : 'Daily Cashback',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 16),
                              ),
                              Text(
                                i % 2 == 1 ? '3:40 PM' : '8:00 AM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 53,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.green.withOpacity(.09),
                          ),
                          child: Center(
                            child: Text(
                              'Promo',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 12,
                                    color: AppColor.green,
                                  ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}

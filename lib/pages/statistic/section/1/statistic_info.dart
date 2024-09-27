part of '../../statisctic_page.dart';

class _StatisticInfo extends StatelessWidget {
  const _StatisticInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.primary,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Income',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.white2),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$5,440',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColor.white,
                        fontSize: 24,
                      ),
                ),
              ],
            ),
          ),
          const LineGradient(color: AppColor.white),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Exspense',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.white2),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$2,209',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColor.white,
                        fontSize: 24,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

part of '../../statisctic_page.dart';

class _StatisticBar extends StatelessWidget {
  const _StatisticBar();

  @override
  Widget build(BuildContext context) {
    final List<double> incomeData = [45, 65, 35, 80, 45, 65, 55];
    final List<double> expenseData = [55, 35, 70, 20, 55, 35, 50];

    const double chartHeight = 170;

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 91,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.white3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Weekly',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: AppColor.gray,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 24,
                  color: AppColor.green,
                ),
                const SizedBox(width: 8),
                Text(
                  'Income',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.black),
                )
              ],
            ),
            const SizedBox(width: 8),
            Row(
              children: [
                const Icon(
                  Icons.arrow_drop_up_rounded,
                  size: 24,
                  color: AppColor.secondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Exspense',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.black),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(incomeData.length, (index) {
            final double totalIncomeExpense =
                incomeData[index] + expenseData[index];
            final double incomeHeight =
                (incomeData[index] / totalIncomeExpense) * chartHeight;
            final double expenseHeight =
                (expenseData[index] / totalIncomeExpense) * chartHeight;

            return Column(
              children: [
                Container(
                  width: 10,
                  height: expenseHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.secondary),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 10,
                  height: incomeHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.green,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  getDayLabel(index),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  String getDayLabel(int index) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[index];
  }
}

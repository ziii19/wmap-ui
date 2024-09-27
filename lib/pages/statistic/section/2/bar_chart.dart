part of '../../static_page_1.dart';

class _BarChart extends StatefulWidget {
  const _BarChart();

  @override
  State<_BarChart> createState() => __BarChartState();
}

class __BarChartState extends State<_BarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<double> incomeData = [1000, 2000, 1400, 3200];
  final List<double> expenseData = [200, 900, 800, 500];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistic Overview',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              'Nov 1, 2020 - Nov 30, 2020',
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
            ),
            const Spacer(),
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
                    'Monthly',
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
          ],
        ),
        const SizedBox(height: 32),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: const Size(double.infinity, 250),
              painter: AnimatedBarChartPainter(
                incomeData: incomeData,
                expenseData: expenseData,
                animationValue: _controller.value,
              ),
            );
          },
        ),
      ],
    );
  }
}

part of '../../statisctic_page.dart';

class _CategoryButton extends StatefulWidget {
  const _CategoryButton();

  @override
  State<_CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<_CategoryButton> {
  String category = 'Income';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(4.0),
        width: MediaQuery.of(context).size.width - 32,
        height: 56,
        decoration: BoxDecoration(
          color: AppColor.white3,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              width: MediaQuery.of(context).size.width / 2 - 32,
              transform: Matrix4.translationValues(
                (MediaQuery.of(context).size.width / 2 - 8) *
                    (category == 'Income' ? 0 : 1),
                0,
                0,
              ),
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColor.white,
              ),
            ),
            Row(
              children: ['Income', 'Expense']
                  .map(
                    (e) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            category = e;
                          });
                        },
                        child: Container(
                          color: AppColor.transparent,
                          child: Center(
                            child: Text(
                              e,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: category == e
                                        ? AppColor.primary
                                        : AppColor.muted,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

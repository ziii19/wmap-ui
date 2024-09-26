part of '../home_page.dart';

class _Discount1 extends StatelessWidget {
  const _Discount1();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 318,
        height: 170,
        decoration: const BoxDecoration(
          color: AppColor.green9,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '30% OFF',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.white,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Black Friday deal',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          color: AppColor.white,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Get discount for every topup,\ntransfer and payment',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          color: AppColor.muted,
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -10,
              top: 70,
              child: Transform(
                transform: Matrix4.rotationZ(-0.436),
                alignment: Alignment.center,
                child: Container(
                  width: 106,
                  height: 123,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, top: 25),
                    child: Transform(
                      transform: Matrix4.rotationZ(0.436),
                      child: Text('30%',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: AppColor.white)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              right: 15,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Discount2 extends StatelessWidget {
  const _Discount2();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 318,
        height: 170,
        color: AppColor.secondary1,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    'Special Offer for\nToday’s Top Up',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Get discount for every topup,\ntransfer and payment',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          color: AppColor.black,
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: -60,
              child: Transform(
                transform: Matrix4.rotationZ(-0.436),
                child: Container(
                  width: 100,
                  height: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.green,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: -10,
              child: Transform(
                transform: Matrix4.rotationZ(-0.436),
                child: Container(
                  width: 100,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.primary,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 60,
              top: 65,
              child: SizedBox(
                width: 25,
                height: 35,
                child: Stack(
                  children: [
                    Positioned(
                      right: 5,
                      top: 9,
                      child: Transform(
                        transform: Matrix4.rotationZ(1.57),
                        child: Container(
                          width: 11,
                          height: 17,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: AppColor.secondary,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Transform(
                        transform: Matrix4.rotationZ(0.785),
                        child: Container(
                          width: 11,
                          height: 17,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            color: AppColor.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 92,
              bottom: 20,
              child: Container(
                width: 32,
                height: 15,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: AppColor.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

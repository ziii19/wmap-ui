part of '../home_page.dart';

class _MainMenu extends StatelessWidget {
  const _MainMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.green,
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsSvg.transfer,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Transfer',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 13),
            width: .5,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.white.withOpacity(0),
                  AppColor.white,
                  AppColor.white.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsSvg.topup,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Top Up',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 13),
            width: .5,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.white.withOpacity(0),
                  AppColor.white,
                  AppColor.white.withOpacity(0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsSvg.history,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'History',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColor.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

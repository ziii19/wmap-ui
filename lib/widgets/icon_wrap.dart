import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/theme/app_color.dart';

class IconWrap extends StatelessWidget {
  final String icon;
  final Color color;
  const IconWrap({
    super.key,
    required this.icon,
    this.color = AppColor.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.muted, width: 2),
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ),
    );
  }
}

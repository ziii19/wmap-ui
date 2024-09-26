import 'package:flutter/material.dart';

import '../utils/theme/app_color.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leading;
  final String? title;
  final Color titleColor;
  final Widget actions;

  const CustomAppBar({
    super.key,
    required this.leading,
    this.title,
    this.titleColor = AppColor.black,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leading,
          if (title != null) ...[
            Text(
              title!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: titleColor,
              ),
            ),
          ],
          actions,
        ],
      ),
    );
  }
}

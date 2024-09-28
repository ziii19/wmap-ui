import 'package:flutter/material.dart';

import '../utils/theme/app_color.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leading;
  final String? title;
  final Color titleColor;
  final List<Widget> actions;
  final EdgeInsetsGeometry? textPadding;

  const CustomAppBar({
    super.key,
    required this.leading,
    this.title,
    this.titleColor = AppColor.black,
    required this.actions,
    this.textPadding = const EdgeInsets.all(0),
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
            Padding(
              padding: textPadding!,
              child: Text(
                title!,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: titleColor,
                ),
              ),
            ),
          ],
          Row(
            children: actions,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static themeLight() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.white,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 28,
          color: AppColor.black,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: AppColor.black,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColor.black,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColor.gray,
        ),
      ),
    );
  }
}

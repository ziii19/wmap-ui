import 'package:flutter/material.dart';
import 'package:wpay/utils/theme/app_theme.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeLight(),
      home: const MainPage(),
    );
  }
}

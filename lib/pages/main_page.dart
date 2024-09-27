import 'package:flutter/material.dart';
import 'package:wpay/pages/home/home_page.dart';
import 'package:wpay/pages/notification/notification_page.dart';
import 'package:wpay/pages/qr/qr_scan_page.dart';
import 'package:wpay/pages/statistic/statisctic_page.dart';
import 'package:wpay/utils/theme/app_color.dart';

import 'statistic/static_page_1.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const StatisticPage(),
    const NotificationPage(),
    const StatisticPage1()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            QrScanPage.route(),
          );
        },
        backgroundColor: AppColor.secondary,
        child: const Icon(
          Icons.crop_free,
          size: 24,
          color: AppColor.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 80,
        color: AppColor.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 18.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24,
                color: _selectedIndex == 0 ? AppColor.primary : AppColor.muted,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.bar_chart,
                size: 24,
                color: _selectedIndex == 1 ? AppColor.primary : AppColor.muted,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 48),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 24,
                color: _selectedIndex == 2 ? AppColor.primary : AppColor.muted,
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 24,
                color: _selectedIndex == 3 ? AppColor.primary : AppColor.muted,
              ),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}

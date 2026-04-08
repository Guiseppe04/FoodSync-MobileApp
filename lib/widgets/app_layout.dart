import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'bottom_nav.dart'; // add mo sa taas

class AppLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentIndex;
  final Function(int) onNavTap;

  const AppLayout({
    super.key,
    required this.title,
    required this.body,
    required this.currentIndex,
    required this.onNavTap,
  });

  int getIndex(String? route) {
    switch (route) {
      case '/home':
      case '/':
        return 0;
      case '/inventory':
        return 1;
      case '/sales':
        return 2;
      case '/logistics':
        return 3;
      case '/analytics':
        return 4;

      // 🔥 FIX
      case '/settings':
        return 0;

      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      drawer: const AppDrawer(),

      body: body,

      bottomNavigationBar: BottomNav(index: currentIndex, onTap: onNavTap),
    );
  }
}

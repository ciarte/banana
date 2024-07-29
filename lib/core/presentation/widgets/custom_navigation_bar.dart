import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    onTap(int value, BuildContext context) {
      switch (value) {
        case 0:
          context.go('/main/0');
          break;
        case 1:
          context.go('/main/1');
          break;
      }
    }

    return BottomNavigationBar(
        onTap: (value) => onTap(value, context),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ]);
  }
}

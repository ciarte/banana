import 'package:banana/core/presentation/widgets/custom_navigation_bar.dart';
import 'package:banana/features/auth_user/presentation/screen/profile_page.dart';
import 'package:banana/features/products/presentation/screen/product_page.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  static const String name = 'main';
  final int pageIndex;

  const MainView({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    ProductsPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: pageIndex),
    );
  }
}

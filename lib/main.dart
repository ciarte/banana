import 'package:banana/screen/login.dart';
import 'package:flutter/material.dart';

import 'screen/not_found_screen.dart';
import 'screen/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/products',
      routes: {
        '/login': (context) => Login(),
        '/products': (context) => const Products(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      },
    );
  }
}


import 'package:banana/config/config.dart';
import 'package:banana/screen/screens.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/products': (context) => const Products(),
        '/products/:id': (context) {
          final String id =
              ModalRoute.of(context)!.settings.arguments.toString();
          return ProductDetailPage(id: id);
        },
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      },
    );
  }
}

import 'package:banana/core/theme/app_theme.dart';
import 'package:banana/features/products/presentation/screen/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/provider/form_provider.dart';
import 'features/auth/presentation/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FormProvider())],
      child: MaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
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
      ),
    );
  }
}

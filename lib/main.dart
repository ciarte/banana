import 'package:banana/core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banana/features/products/presentation/screen/screens.dart';
import 'features/auth_user/data/datasource/aut_api_service.dart';
import 'features/auth_user/data/repositories/auth_repository_impl.dart';
import 'features/auth_user/domain/usecase/login_usecase.dart';
import 'features/auth_user/presentation/provider/form_provider.dart';
import 'features/auth_user/presentation/screen/login.dart';
import 'features/products/data/datasource/product_api_service.dart';
import 'features/products/presentation/provider/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FormProvider(
            LoginUseCase(
              AuthRepositoryImpl(AuthenticationApiService()),
            ),
          ),
        ),
        ChangeNotifierProvider(
            create: (context) => ProductProvider(ProductApiService())),
      ],
      child: MaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
          '/products': (context) => const ProductsPage(),
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

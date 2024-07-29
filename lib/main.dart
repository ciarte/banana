import 'package:banana/core/core.dart';
import 'package:banana/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth_user/data/datasource/aut_api_service.dart';
import 'features/auth_user/data/repositories/auth_repository_impl.dart';
import 'features/auth_user/domain/usecase/login_usecase.dart';
import 'features/auth_user/presentation/provider/form_provider.dart';
import 'features/auth_user/presentation/provider/user_provider.dart';
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
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(
            create: (context) => ProductProvider(ProductApiService())),
      ],
      child: MaterialApp.router(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: router,
      ),
    );
  }
}

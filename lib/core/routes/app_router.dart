import 'package:banana/core/core.dart';
import 'package:banana/core/presentation/screens/main_view.dart';
import 'package:banana/features/auth_user/presentation/presentation.dart';
import 'package:banana/features/auth_user/presentation/screen/profile_page.dart';
import 'package:banana/features/products/presentation/screen/product_detail_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const Login()),
    GoRoute(
        path: '/main/:page',
        builder: (context, state) {
          final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
          return MainView(pageIndex: pageIndex);
        },
        routes: [
          GoRoute(
              path: 'products/:id',
              builder: (constext, state) {
                final productId = state.pathParameters['id'];
                return ProductDetailPage(id: productId!);
              })
        ]),
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
  ],
  errorBuilder: (context, state) =>
      NotFoundScreen(routeName: '/login', text: state.error.toString()),
);

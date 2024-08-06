//Importaciones flutter
import 'package:go_router/go_router.dart';

//Importaciones Nuestras
import 'package:teslo_shop_app/features/auth/auth.dart';
import 'package:teslo_shop_app/features/products/products.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsScreen(),
    ),
  ],

  ///! TODO: Bloquear si no se está autenticado de alguna manera
);
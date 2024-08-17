//Importaciones flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//Importaciones Nuestras
import 'package:teslo_shop_app/features/auth/auth.dart';
import 'package:teslo_shop_app/features/products/products.dart';

//Realizamos todo el Go Router con provider
final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      //Primera pantalla
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),

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

    //Autenticación con redirect
    redirect: (context, state) {
      //return '/';
      return null;
    },
  );
});

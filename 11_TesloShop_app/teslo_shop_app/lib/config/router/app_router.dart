//Importaciones flutter
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones Nuestras
import 'package:teslo_shop_app/features/auth/auth.dart';
import 'package:teslo_shop_app/config/router/app_router_notifier.dart';
import 'package:teslo_shop_app/features/products/products.dart';

//Realizamos todo el Go Router con provider
final goRouterProvider = Provider((ref) {
  //
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/login',

    //? Colocamos un Refresh listener que espera cuando algo cambia en la aplicación
    refreshListenable: goRouterNotifier,

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
      print(state.matchedLocation);
    },
  );
});

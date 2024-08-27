//Importaciones flutter
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones Nuestras
import 'package:teslo_shop_app/features/auth/auth.dart';
import 'package:teslo_shop_app/config/router/app_router_notifier.dart';
import 'package:teslo_shop_app/features/auth/presentation/providers/auth/auth_provider.dart';
import 'package:teslo_shop_app/features/products/products.dart';

//Realizamos todo el Go Router con provider
final goRouterProvider = Provider((ref) {
  //
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',

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
      //? Propiedad a que pagina se redirige o a que pagina va
      final isGoingTo = state.matchedLocation;
      //?Propiedad para ver si esta autenticado o no
      final authStatus = goRouterNotifier.authStatus;

      print('GRouter isLoggedIn $authStatus, $isGoingTo');

      //Sí va al splash screen, y estoy verificando la autorización o los datos de la persona
      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }

      //Si el usuario no esta autenticado, debemos ver a donde quiere ir el usuario
      if (authStatus == AuthStatus.notAuthenticated) {
        //Si no esta autenticado, que el usuario valla donde el quiera.
        if (isGoingTo == '/login' || isGoingTo == '/register') return null;

        //SI no esta en ninguna de esas rutas, mandalo si o si al login.
        return '/login';
      }

      //Si el usuario esta autenticado, entonces lo dejamos pasar
      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      //Si el usuario es administrador
      //if (user.admin) {}

      return null;
    },
  );
});

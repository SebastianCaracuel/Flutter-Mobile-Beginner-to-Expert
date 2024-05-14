import 'package:go_router/go_router.dart';
import 'package:w_app/presentation/screens/screens.dart';

//Creamos nuestra configuración del router - Para poder realizar navegaciones entre pantallas de forma optima

final appRouter = GoRouter(
  //Definimos la ruta inicial - Nuestro HomeScreen
  initialLocation: '/',

  //Creamos nuestras rutas con sus respectivos path
  routes: [
    //Ruta inicial - HomeScreen
    GoRoute(
        //El path es el Url de la ruta
        path: '/',
        builder: (context, state) => const HomeScreen()),

    //Primera ruta - Botones
    GoRoute(
        //El path es el Url de la ruta
        path: '/buttons',
        builder: (context, state) => const ButtonsScreen()),

    //Segunda ruta - Botones
    GoRoute(
        //El path es el Url de la ruta
        path: '/cards',
        builder: (context, state) => const CardsScreen()),
  ],
);

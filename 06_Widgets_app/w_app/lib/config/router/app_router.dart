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
        //Agregamos un nombre a nuestra ruta gracias a la propiedad que creamos
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen()),

    //Primera ruta - Botones
    GoRoute(
        //El path es el Url de la ruta
        path: '/buttons',
        //Colocamos el nombre de nuestra ruta que esta definida como propiedad en buttonsScreen
        name: ButtonsScreen.name,
        builder: (context, state) => const ButtonsScreen()),

    //Segunda ruta - Botones
    GoRoute(
        //El path es el Url de la ruta
        path: '/cards',
        //colocamos el nombre de nuestra ruta
        name: CardsScreen.name,
        builder: (context, state) => const CardsScreen()),
  ],
);

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

    //Segunda ruta - Tarjetas
    GoRoute(
        //El path es el Url de la ruta
        path: '/cards',
        //colocamos el nombre de nuestra ruta
        name: CardsScreen.name,
        builder: (context, state) => const CardsScreen()),

    //Tercera ruta - ProgressIndicator
    GoRoute(
        //El path es el Url de la ruta
        path: '/progress',
        //colocamos el nombre de nuestra ruta
        name: ProgressScreen.name,
        builder: (context, state) => const ProgressScreen()),

    //Cuarta ruta - SnackBars
    GoRoute(
        //El path es el Url de la ruta
        path: '/snackbars',
        //colocamos el nombre de nuestra ruta
        name: SnackbarScreen.name,
        builder: (context, state) => const SnackbarScreen()),

    //Quinta ruta - Animated
    GoRoute(
        //El path es el Url de la ruta
        path: '/animated',
        //colocamos el nombre de nuestra ruta
        name: AnimatedScreen.name,
        builder: (context, state) => const AnimatedScreen()),

    //Sexta ruta - UI CONTROLS
    GoRoute(
        //El path es el Url de la ruta
        path: '/ui-controls',
        //colocamos el nombre de nuestra ruta
        name: UicontrolsScreen.name,
        builder: (context, state) => const UicontrolsScreen()),

    //Septima ruta - Tutorial - Preloader
    GoRoute(
        //El path es el Url de la ruta
        path: '/tutorial',
        //colocamos el nombre de nuestra ruta
        name: AppTutorialScreen.name,
        builder: (context, state) => const AppTutorialScreen()),

    //Octava ruta - Infinite Scroll
    GoRoute(
        //El path es el Url de la ruta
        path: '/infinite',
        //colocamos el nombre de nuestra ruta
        name: InfiniteScrollScreen.name,
        builder: (context, state) => const InfiniteScrollScreen()),

    //Novena ruta - Counter Screen
    GoRoute(
        //El path es el Url de la ruta
        path: '/counter',
        //colocamos el nombre de nuestra ruta
        name: CounterScreen.name,
        builder: (context, state) => const CounterScreen()),

    //Decima ruta - Theme changer Screen
    GoRoute(
        //El path es el Url de la ruta
        path: '/theme-changer',
        //colocamos el nombre de nuestra ruta
        name: ThemeChangeScreen.name,
        builder: (context, state) => const ThemeChangeScreen()),
  ],
);

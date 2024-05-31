//Importación de Flutter
import 'package:go_router/go_router.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/screens/all_screens.dart';

//Creamos la clase implementando el Go_Router
final appRouter = GoRouter(
  //?Creamos una ruta inicial
  initialLocation: '/',

  //?Todas las rutas
  routes: [
    //Ruta inicial - Home Screen
    GoRoute(
        //Ruta definida para la pantalla
        path: '/',
        //Nombre definido para la pantalla
        name: HomeScreen.name,
        //Builder
        builder: (context, state) => const HomeScreen(),

        //todo:Definimos rutas anidads de la ruta HomeScreen
        routes: [
          //Ruta navegación - película Screen
          GoRoute(
              //Ruta definida para la pantalla
              path: 'movie/:id',
              //Nombre definido para la pantalla
              name: MovieScreen.name,
              //Builder
              builder: (context, state) {
                //?Como obtengo el ID de la película
                final movieId = state.pathParameters['id'] ?? 'no-id';

                return MovieScreen(movieId: movieId);
              }),
        ]),
  ],
);

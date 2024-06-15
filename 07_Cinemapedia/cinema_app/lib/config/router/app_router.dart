//Importación de Flutter
import 'package:go_router/go_router.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/views/views.dart';
import 'package:cinema_app/presentation/screens/all_screens.dart';

//Creamos la clase implementando el Go_Router
final appRouter = GoRouter(
  //?Creamos una ruta inicial
  initialLocation: '/',

  routes: [
    //Todo: Utilización del ShellRoute
    ShellRoute(
      //Es algo que se va a llamar en tiempo de ejecución para construir algo
      builder: (context, state, child) {
        //Llamamos al HomeScreen para que tenga el Appbar,
        //Pero llamamos también a la vista del HomeScreen
        return HomeScreen(childView: child);
      },
      //Las rutas
      routes: [
        GoRoute(
          //Home Vista
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
          //Las routes Hijas
          routes: [
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
          ],
        ),
        GoRoute(
            // Favoritos vista
            path: '/favorites',
            builder: (context, state) {
              return const FavoritesViews();
            }),
      ],
    ),
  ],
);

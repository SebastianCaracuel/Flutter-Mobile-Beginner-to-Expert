//Importación de Flutter
import 'package:go_router/go_router.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/screens/all_screens.dart';

//Creamos la clase implementando el Go_Router
final appRouter = GoRouter(
  //?Creamos una ruta inicial
  initialLocation: '/home/0',

  routes: [
    GoRoute(
      //Home Vista
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
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

    //Realizamos una configuración, ya que, no existe otra ruta con '/'
    //Nuestra ruta inicial es '/home' por lo que, si alguien navega hacia '/'
    //Sera redireccionado
    GoRoute(
      //Ruta
      path: '/',
      // El guión y doble guión indica que no necesito ninguno de esos dos argumentos
      redirect: (_, __) => '/home/0',
    )
  ],
);

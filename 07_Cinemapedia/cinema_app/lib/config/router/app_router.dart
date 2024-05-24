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
        builder: (context, state) => const HomeScreen()),
  ],
);

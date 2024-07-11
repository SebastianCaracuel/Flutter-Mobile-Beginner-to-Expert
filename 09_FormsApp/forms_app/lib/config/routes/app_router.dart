//? Este es un archivo donde estarán las rutas de la aplicación ( Rutas de navegación )

//Importaciones Flutter
import 'package:go_router/go_router.dart';

//Importaciones Nuestras
import 'package:forms_app/presentation/screens.dart';
//

final appRouter = GoRouter(
  //La ruta inicial a la que irá nuestra aplicación
  initialLocation: '/',

  //Rutas de navegación
  routes: [
    //Ruta inicial - Home Screen
    GoRoute(
      //Path que tendrá la ruta
      path: '/home',
      //Lo mandamos a la presentación a la que navegaremos
      builder: (context, state) => const HomeScreen(),
    ),

    //Tutorial
    GoRoute(
      //Path que tendrá la ruta
      path: '/',
      //Lo mandamos a la presentación a la que navegaremos
      builder: (context, state) => const TutorialScreen(),
    ),

    //Ruta Menu - Cubits
    GoRoute(
      //Path que tendrá la ruta
      path: '/cubits',
      //Lo mandamos a la presentación a la que navegaremos
      builder: (context, state) => const CubitsScreen(),
    ),
    //Ruta Menu - Bloc
    GoRoute(
      //Path que tendrá la ruta
      path: '/bloc',
      //Lo mandamos a la presentación a la que navegaremos
      builder: (context, state) => const BlocScreen(),
    ),

    //Ruta Menu - Formulario
    GoRoute(
      //Path que tendrá la ruta
      path: '/new-user',
      //Lo mandamos a la presentación a la que navegaremos
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);

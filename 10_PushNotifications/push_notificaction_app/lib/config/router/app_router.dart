//? Este es el archivo de las rutas

//Importaciones Flutter
import 'package:go_router/go_router.dart';

//Importaciones nuestras
import 'package:push_notificaction_app/presentation/screens.dart';

//Creamos la Variable que utilizaremos
final appRouter = GoRouter(
  //? Definimos el Path inicial donde partirá nuestra aplicación
  initialLocation: '/',

  //Definimos las rutas
  routes: [
    //Definimos la ruta de la pantalla inicial
    GoRoute(
        path: '/',
        //Colocamos nuestra clase de la primera pantalla
        builder: (context, state) => const HomeScreen()),

    //Definimos la ruta de la pantalla de detalles del mensaje
    GoRoute(
        path: '/push-details/:messageId',
        //Colocamos nuestra clase de la primera pantalla
        builder: (context, state) => DetailScreen(
              pushMessageId: state.pathParameters['messageId'] ?? '',
            )),
  ],
);

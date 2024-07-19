//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Importaciones nuestras
import 'package:push_notificaction_app/config/theme/app_theme.dart';
import 'package:push_notificaction_app/config/router/app_router.dart';
import 'package:push_notificaction_app/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {
  //Inicialiazmos Firebase
  WidgetsFlutterBinding.ensureInitialized();
  //Configuración de Firebase
  await NotificationsBloc.initializeFirebaseNotifications();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NotificationsBloc())],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //Configuramos el router
      routerConfig: appRouter,

      //Quitamos el banner debugShowCheckedModeBanner: false,
      //Colocamos el color de la aplicación
      theme: AppTheme().getTheme(),
    );
  }
}

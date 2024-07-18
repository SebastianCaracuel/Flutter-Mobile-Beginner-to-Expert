//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:push_notificaction_app/config/router/app_router.dart';

//Importaciones nuestras
import 'package:push_notificaction_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
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

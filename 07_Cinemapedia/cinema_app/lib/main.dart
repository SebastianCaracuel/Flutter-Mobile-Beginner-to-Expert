//Importaciones de Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/config/router/app_router.dart';
import 'package:cinema_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Implementamos el router
    return MaterialApp.router(
      //?Dirección de la primera pantalla  - Home
      routerConfig: appRouter,

      //?Banner
      //debugShowCheckedModeBanner: false,

      //?Llamamos a nuestro tema de la aplicación
      theme: ApptTheme().getTheme(),
    );
  }
}

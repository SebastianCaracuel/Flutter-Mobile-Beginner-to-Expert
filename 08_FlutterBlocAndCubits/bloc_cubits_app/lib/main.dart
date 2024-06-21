//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaciones nuestras
import 'package:bloc_cubits_app/config/theme/app_theme.dart';

//Devolvemos nuestro Widget
void main() {
  runApp(const MainApp());
}

//Creamos la clase main para que corra nuestra aplicación
class MainApp extends StatelessWidget {
  //Propiedades

  //Constructor
  const MainApp({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propieades del objeto

    //Widget Padre
    return MaterialApp(
      //debugShowCheckedModeBanner: false, //? Le quitamos el Debug
      //Colocamos nuestro tema de la aplicación
      theme: AppTheme().getTheme(),
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

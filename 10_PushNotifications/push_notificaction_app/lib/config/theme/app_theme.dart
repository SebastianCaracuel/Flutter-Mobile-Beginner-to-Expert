//? Creamos cual será el tema de nuestra aplicación

//Importaciones Flutter
import 'package:flutter/material.dart';

//Creamos la clase de nuestra tema de la aplicación
class AppTheme {
  ThemeData getTheme() => ThemeData(
      //Colocamos la material 3
      useMaterial3: true,
      //Le asignamos un color a nuestra aplicación
      colorSchemeSeed: Colors.blueGrey);
}

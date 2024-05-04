//Creamos la clase de nuestro tema o estilo de la aplicación
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        //activamos el material3
        useMaterial3: true,
        //Utilizaremos la aplicación de modo Oscuro.
        brightness: Brightness.dark,
      );
}

//IMPORTACIONES
import 'package:flutter/material.dart';

//Creamos una clase para el tema de la aplicación
class AppTheme {
  //METODO
  ThemeData getTheme() => ThemeData(
        //Importamos material 3
        useMaterial3: true,
        //Usaremos la aplicación con un tema oscuro.
        brightness: Brightness.dark,
      );
}

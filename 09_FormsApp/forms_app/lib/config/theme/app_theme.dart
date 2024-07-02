//? Este es un archivo que contiene el tema de la aplicación (Color - Colores - Diseño)

//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaciones Nuestras

//Creamos la clase para utilizar el Tema

class AppTheme {
  //Propiedades de la clase

  //Constructor

  //?Creamos un método que regresará el ThemeData y lo colocamos con una variable para poder utilizarlo
  ThemeData getTheme() {
    //Propiedades

    //?Creamos una propiedad para el color de la app
    const seedColor = Colors.deepPurple;

    //Retornamos el ThemeData
    return ThemeData(
      //Colocamos que el estilo o diseño sea Material 3
      useMaterial3: true,
      //Colocamos nuestra variable de color
      colorSchemeSeed: seedColor,
      //Colocamos la aplicación en modo Oscuro
      brightness: Brightness.dark,
      //Creamos un estilo de lista para que un icono de una lista sea el color que tenemos definido
      listTileTheme: const ListTileThemeData(iconColor: seedColor),
    );
  }
}

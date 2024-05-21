import 'package:flutter/material.dart';

//Cremaos un arreglo de colores

const colorList = <Color>[
  Colors.teal,
  Colors.red,
  Colors.blueGrey,
  Colors.brown,
  Colors.orange,
  Colors.greenAccent,
  Colors.pink,
  Colors.purple,
];

//CREAMOS LA CLASE para colocar los colores o el tema de la aplicación

class AppTheme {
  //Propiedades
  final int selectedColor;
  final bool isDarkMode;

  //Constructor con parametros
  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
      //Nos preocupamos que ningún otro programador vaya a asignar un color que este fuera de mi arreglo
      : assert(selectedColor >= 0, 'Selected color must be Greater then 0'),
        //Ahora nos preocupamos que se asigne el color dentro del tamaño de nuestra lista
        assert(selectedColor < colorList.length,
            'Selected color must be lees or equal than ${colorList.length - 1}');

  //IMplementamos el metodo
  ThemeData getTheme() => ThemeData(
      //Llamamos al material 3
      useMaterial3: true,
      //Modo oscuro - implementación del Provider Riverpod
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      //Colores
      colorSchemeSeed: colorList[selectedColor],
      //Colocamos un estilo o formato a nuestro menu o appbar
      appBarTheme: const AppBarTheme(
          //Centramos nuestro titulo
          centerTitle: true));
}

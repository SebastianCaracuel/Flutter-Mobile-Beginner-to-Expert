//Importaciones de Flutter
import 'package:flutter/material.dart';

//Creamos una clase para nuestro tema
class ApptTheme {
  //Propiedades

  //? Cambiar de color a darkmode
  final bool isDarkMode;

  //COnstructor
  ApptTheme({this.isDarkMode = false});

  ThemeData getTheme() => ThemeData(
        //Material 3
        useMaterial3: true,
        //Color de la aplicación
        colorSchemeSeed: const Color(0xff2862F5),
        //todo:Darkmode
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      );

  //Creamos un método que es la copia de la clase
  ApptTheme copyWith({bool? isDarkmode}) => ApptTheme(
        isDarkMode: isDarkmode ?? isDarkMode,
      );
}

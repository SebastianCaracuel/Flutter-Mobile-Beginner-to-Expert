//Importaciones de Flutter
import 'package:flutter/material.dart';

//Creamos una clase para nuestro tema
class ApptTheme {
  ThemeData getTheme() => ThemeData(
        //Material 3
        useMaterial3: true,
        //Color de la aplicación
        colorSchemeSeed: const Color(0xff2862F5),
      );
}

import 'package:flutter/material.dart';

//?Las variables que tienen Guión bajo significa que solo pueden ser usadas en este Archivo.

//Creamos una constante de color personalizado
//Colocamos nuestro custom color en privado con guión bajo
const Color _customColor = Color(0xFF076A15);

//Creamos una constante de una lista de colores
const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.yellow,
];

//Creación de clase que vamos a exportar
class AppTheme {
  //
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      //?Creamos una aserción para que cuando haya un error de largo en la lista
      //?aparezca que el color debe estar entre 0 al largo de la lista creada.
      : assert(selectedColor >= 0 && selectedColor <= _colorTheme.length - 1,
            'Colors must be between 0 and ${_colorTheme.length}');

  //Creamos un metodo con ThemeDATA
  ThemeData theme() {
    return ThemeData(
        //Dejamos que tenga el Material3 ACTIVADO
        useMaterial3: true,
        //?Que pasa si queremos nuestra app en modo oscuro
        //!brightness: Brightness.dark,
        //Asignamos la lista que nosotros podamos cambiar el color que queramos en nuestra aplicación de la lista que se encuentra arriba.
        colorSchemeSeed: _colorTheme[selectedColor]);
  }
}

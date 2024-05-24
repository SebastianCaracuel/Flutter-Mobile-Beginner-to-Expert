//Importaciones de Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/config/constants/environment.dart';

//Creamos la clases
class HomeScreen extends StatelessWidget {
  //Propiedades de la clase
  //?Nombre de la screen
  static const name = 'home_screen';

  //Constructor de la clase
  const HomeScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widgets
    return Scaffold(
      body: Center(
        child: Text(Environment.movieDBKey),
      ),
    );
  }
}

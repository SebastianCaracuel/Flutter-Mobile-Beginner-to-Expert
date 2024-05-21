//Importaciones
import 'package:flutter/material.dart';

//Clase
class ThemeChangeScreen extends StatelessWidget {
  //Propiedades

  //Constructor
  const ThemeChangeScreen({super.key});

//Objeto
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //MenuSuperior
      appBar: AppBar(
          //titulo
          title: const Text('Theme Change')),

      //Cuerpo
      body: ListView(
        children: const [
          Card(child: Text('hola mundo')),
        ],
      ),
    );
  }
}

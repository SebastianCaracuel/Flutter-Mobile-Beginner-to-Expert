//? Este es la pantalla del Cubits - Esto será un Counter App

//Importaciones Flutter
import 'package:flutter/material.dart';
//Importaciones Nuestras

//Creamos la clase para la pantalla de Cubits
class CubitsScreen extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const CubitsScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //!Widget Padre
    return Scaffold(
      //Colocamos una barra superior
      appBar: AppBar(
        title: const Center(child: Text('Cubits Counter')),
      ),
      //Cuerpo
      body: const Center(child: Text('Counter Value: xxxxx')),
    );
  }
}

//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaciones Nuestras

//Creamos la clase
class HeadersPage extends StatelessWidget {
  //Constructor
  const HeadersPage({super.key});

  //Objeti
  @override
  Widget build(BuildContext context) {
    //Widget Padre!
    return const Scaffold(
      //?No utilizamos un appBar

      body: Center(
        child: Text('Hola mundo'),
      ),
    );
  }
}

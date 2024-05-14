import 'package:flutter/material.dart';

//Creamos el Archivo o screen para Botones

class ButtonsScreen extends StatelessWidget {
  //Creamos la ruta estatica para el nombre de la screen
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const Placeholder(),
    );
  }
}

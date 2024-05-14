import 'package:flutter/material.dart';

//Creamos ahora el screen de las tarjetas

class CardsScreen extends StatelessWidget {
  //Creamos la ruta estatica para el nombre de la screen
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const Placeholder(),
    );
  }
}

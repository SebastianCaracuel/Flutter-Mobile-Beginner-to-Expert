//? Este es un archivo del cargado de pantalla completa

//Importaciones de flutter
import 'package:flutter/material.dart';

//Importaciones nuestras

//Clases
class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

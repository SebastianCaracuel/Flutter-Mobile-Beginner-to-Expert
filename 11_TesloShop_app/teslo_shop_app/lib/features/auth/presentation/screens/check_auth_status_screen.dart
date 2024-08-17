//? Este es un archivo para ver la verificación del estatus de la autorización del incio de seción

//Importaciones flutter
import 'package:flutter/material.dart';

//Importaciones nuestras

//Creamos una clases

class CheckAuthStatusScreen extends StatelessWidget {
  //Propieades

  //COnstructor
  const CheckAuthStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

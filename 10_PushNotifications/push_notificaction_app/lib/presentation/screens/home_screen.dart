//? Este es el archivo de la pantalla incial

//Importaciones Flutter
import 'package:flutter/material.dart';
//Importaciones Nuestras

//Creamos la clase que será nuestra pantalla inicial con sus respectivos Widgets
class HomeScreen extends StatelessWidget {
  //Propieades de la clase

  //Constructor de la clase
  const HomeScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propieades del Objeto

    //!Widget Padre
    return Scaffold(
      //Creamos una barra superior
      appBar: AppBar(
        //Le añadimos un texto como titulo
        title: const Text('Permiso'),
        //Creamos unos botones
        actions: [
          IconButton(
              onPressed: () {
                //todo: solicitar permiso de notificaciones
              },
              icon: const Icon(Icons.settings)),
        ],
      ),

      body: const _HomeView(),
    );
  }
}

//Creamos un Widget privado para mantener nuestro Widget principal
class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

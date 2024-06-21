//? Este es el archivo de la pagina principal

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Importaciones nuestras

//Creamos el Widget de la pantalla
class HomeScreen extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const HomeScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades

    //!Widget padre
    return Scaffold(
      //body
      body: ListView(
        children: [
          //Cubits
          ListTile(
              //Titulo de la lista
              title: const Text('Cubits'),
              //Subtitulo
              subtitle: const Text('Gestor de Estado Simple'),
              //Icono
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              //todo: Función de navegación
              onTap: () => context.push('/cubits')),

          //BLoC
          ListTile(
              //Titulo de la lista
              title: const Text('BLoC'),
              //Subtitulo
              subtitle: const Text('Gestor de Estado Simple'),
              //Icono
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              //todo: Función de navegación
              onTap: () => context.push('/bloc')),

          //Expanded
        ],
      ),
    );
  }
}

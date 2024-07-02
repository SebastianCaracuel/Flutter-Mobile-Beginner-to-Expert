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
              subtitle: const Text('Gestor de Estado compuesto'),
              //Icono
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              //todo: Función de navegación
              onTap: () => context.push('/bloc')),

          //Divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Divider(),
          ),

          //Expanded
          const Expanded(
              child: Column(
            children: [
              //Titulo
              Text('Hello World',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
              //Contenido
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "📱 Counter App With Flutter BLoC 👨🏽‍💻\n\n"
                      "Características:\n"
                      "1️⃣ Incrementar contador\n"
                      "0️⃣ Reiniciar contador\n\n"
                      "🔍 Tecnologías:\n"
                      "Flutter, Dart, BLoC, Cubits\n\n"
                      "¿Como utilizar Flutter BLoC? \n"
                      "📌DevTalles\n\n"
                      "Ideal para principiantes 🚀\n",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),

              FlutterLogo(size: 80),
            ],
          ))
        ],
      ),
    );
  }
}

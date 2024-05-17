import 'package:flutter/material.dart';

//Creamos nuestra Screen
class AnimatedScreen extends StatelessWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'animated_screen';

  //Constructor
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Menu
      appBar: AppBar(
          //Titulo
          title: const Text('Animated Container')),

      //Dentro de nuestor body, creamos nuestro container
      body: Center(
          //Contenedor
          child: AnimatedContainer(
        //Le asignamos un tiempo a la animación
        duration: const Duration(milliseconds: 400),

        //Le asginamos el tipo de animación que queremos
        curve: Curves.easeInOutCubic,
        //Le colocamos unas medidas a nuestro contenedero
        width: 100,
        height: 100,
        //Decoramos nuestro contenedor
        decoration: BoxDecoration(
            //Le asignamos un color
            color: Colors.blue,
            //Le asignamos un borde
            borderRadius: BorderRadius.circular(20)),
      )),

      //Botón flotante para la acción de que el container cambie de tamaño
      floatingActionButton: FloatingActionButton(
        //Funcionamiento
        onPressed: () {},
        //Icono del botón
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}

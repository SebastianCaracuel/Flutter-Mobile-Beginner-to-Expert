import 'package:flutter/material.dart';

//Importamos números random o operaciones matematicas predeterminadas por flutter
import 'dart:math' show Random; //Crea números aleatorios

//Creamos nuestra Screen
class AnimatedScreen extends StatefulWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'animated_screen';

  //Constructor
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  //Propiedades para animación

  //Propiedades de tamaño
  double width = 50;
  double height = 50;
  //Propiedad de color
  Color color = Colors.indigo;
  //Propiedad de Border Radius
  double borderRadius = 10.0;

  //Creamos un metodo que no va a regresar nada
  void changeShape() {
    //instanciamos nuestro random
    final random = Random();

    //Colocamos los valores de forma aleatoria

    width = random.nextInt(300) + 120;
    height = random.nextInt(300) + 120;
    borderRadius = random.nextInt(100) + 20;

    color = Color.fromRGBO(
        random.nextInt(255), //blue
        random.nextInt(255), //red
        random.nextInt(255),
        1); //Opacidad

    //Llamamos a nuestor SetState
    setState(() {});
  }

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
        curve: Curves.easeInOutCubicEmphasized,

        //asignamos nuestras propiedades en su  debido lugar
        width: width <= 0 ? 0 : width,
        height: height <= 0 ? 0 : height,
        //Decoramos nuestro contenedor
        decoration: BoxDecoration(
            //Le asignamos un color
            color: color,
            //Le asignamos un borde
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)),
      )),

      //Botón flotante para la acción de que el container cambie de tamaño
      floatingActionButton: FloatingActionButton(
        //Funcionamiento
        onPressed: changeShape,
        //Icono del botón
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}

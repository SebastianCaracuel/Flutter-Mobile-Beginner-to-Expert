//Importaciones Flutter
import 'package:flutter/material.dart';
import 'dart:math' as Math;
//Importaciones nuestras

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

//? Animación del Cuadrado
class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({super.key});

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

//todo: Aquí crearemos una animación Personalizada.
class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  //Controlador
  late AnimationController controller;

  //La animación es que tipo de cosa yo quiero animar.
  late Animation<double> rotacion;

  //? init
  @override
  void initState() {
    //Configuramos el controllador
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    //¿Que tipo de animación quiero?
    rotacion = Tween(
      begin: 0.0,
      end: 2 * Math.pi,
    ).animate(controller);

    //El transcurso de la animación
    controller.addListener(() {
      print('Status ${controller.status}');

      //? Cuando termina la animación, ahora animalo en reversa
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
      //?Y cuando termine el Reversa, que comience otra vez, esto haría un Loop Infinito
      // else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

    super.initState();
  }

  //?
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //?Cuando queremos que se haga la animación? / Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        //?+Si queremos rotar el cuadrado, debemos colocar un transform.rotate
        return Transform.rotate(
          angle: rotacion.value,
          child: const _Cuadrado(),
        );
      },
    );
  }
}

//? Creamos el Cuadrado con el snipped
class _Cuadrado extends StatelessWidget {
  const _Cuadrado();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}

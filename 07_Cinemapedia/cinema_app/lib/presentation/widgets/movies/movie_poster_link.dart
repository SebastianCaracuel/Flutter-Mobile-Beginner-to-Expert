//Importaciones Flutter
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/entities.dart';

//? Este Widget trata sobre

//Creación de la clase
class MoviePosterLink extends StatelessWidget {
  //Propiedades de la clase

  //? LLamamos a nuestra entidad de películas y le colocamos una variable
  final Movie movie;

  //Constructor con parametros
  const MoviePosterLink({super.key, required this.movie});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //?
    final random = Random();

    //Widget Padre | Utilizamos un Gestor de detecciónes para navegar a la película Favorita
    //Utilizamos un FadeInUp Para una animación, utilizando animate do de fernando herrero
    return FadeInUp(
      // 'from' especifica la distancia vertical desde la que el widget comenzará a moverse hacia arriba
      // random.nextInt(100) genera un número aleatorio entre 0 y 99
      // Al sumarle 80, el rango final es de 80 a 179, creando variabilidad en la posición inicial de la animación
      from: random.nextInt(100) + 80,

      // 'delay' especifica el retraso antes de que comience la animación
      // random.nextInt(450) genera un número aleatorio entre 0 y 449 milisegundos
      // Esto introduce un retraso aleatorio antes de que la animación comience, haciendo que cada instancia se inicie en un momento diferente
      delay: Duration(milliseconds: random.nextInt(450) + 0),
      child: GestureDetector(
        //? Al presionar la tarjeta, nos redireccionará a la película seleccionada
        onTap: () => context.push('/home/0/movie/${movie.id}'),
        // Utilizamos un ClipRRect para que tenga bordes redondendados
        child: ClipRRect(
            //Colocamos bordes redondeados a nuestras tarjetas
            borderRadius: BorderRadius.circular(20),
            //Utilizamos un FadeInImage para una carga de imagen
            child: FadeInImage(
              //Le damos un alto a la imagen
              height: 180,
              //Que la imagen ocupe todo el espaico y se expanda
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
              image: NetworkImage(movie.posterPath),
            )),
      ),
    );
  }
}

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:go_router/go_router.dart';

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

    //Widget Padre | Utilizamos un Gestor de detecciónes para navegar a la película Favorita
    return GestureDetector(
      //? Al presionar la tarjeta, nos redireccionará a la película seleccionada
      onTap: () => context.push('/home/0/movie/${movie.id}'),
      // Utilizamos un ClipRRect para que tenga bordes redondendados
      child: ClipRRect(
        //Colocamos bordes redondeados a nuestras tarjetas
        borderRadius: BorderRadius.circular(20),
        //Utilizamos un Fade IN Para una animación, utilizando animate do de fernando herrera
        child: FadeIn(
          //LLamamos a la imagen de la película para que podamos visualizarlo
          child: Image.network(movie.posterPath),
        ),
      ),
    );
  }
}

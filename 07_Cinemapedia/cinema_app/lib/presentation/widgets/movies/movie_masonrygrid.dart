//Importaciones Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';

//? Este es un Widget para utilizar el Masonry, configurar el diseño que tendrán los Grid o tarjetas.

//Clase de Masorny
class MoviesMasonry extends StatefulWidget {
  //Propiedades de la clase

  //? LLamamos a nuestras películas de nuestras entidades y le damos una variable
  final List<Movie> movies;

  //? Esta es una variable para saber si esta la siguiente pagina
  final VoidCallback? laodNextPage;

  //Constructor con parametros
  const MoviesMasonry({super.key, required this.movies, this.laodNextPage});

  @override
  State<MoviesMasonry> createState() => _MoviesMasonryState();
}

//Clase con el State
class _MoviesMasonryState extends State<MoviesMasonry> {
  //Propiedades del State

  //?Creamos una propiedad de controller para tener el control de la acción que el cliente esta realizando
  final scrollController = ScrollController();

  //todo: init state - Iniciamos el controlador
  @override
  void initState() {
    super.initState();

    //añadimos el listener y la propiedad del controlador
    scrollController.addListener(() {
      //? Llamamos al cargador de la siguiente pagina, si no tiene nada que no regrese nada
      if (widget.laodNextPage == null) return;

      //? pero si tiene algo, si tengo un widget o un callback
      if ((scrollController.position.pixels + 100) >=
          scrollController.position.maxScrollExtent) {
        //
        widget.laodNextPage!();
      }
    });
  }

  //todo: dispose - Cerramos el controlador
  @override
  void dispose() {
    //Cerramos el controlador
    scrollController.dispose();
    super.dispose();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widget Padre
    return Padding(
      //Envolvimos todo el Masonry en un padding para que no este tan apegado a los bordes de nuestro celular
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // ! Masonry -
      child: MasonryGridView.count(
        // ? LLamamos a nuestro controllador
        controller: scrollController,
        // ?Quiero que tenga un rebote de scroll
        physics: const BouncingScrollPhysics(),
        //? ¿Cuantas columnas queremos del Grid? - 3 Columnas
        crossAxisCount: 3,
        //? Colocamos el largo de las peliculas para que no se desborde nuestra aplicación
        itemCount: widget.movies.length,
        //? Colocamos un espacio de division superior entre las tarjetas
        mainAxisSpacing: 10,
        //? Colocamos un espacio de devision lateral entre las tarjetas
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          //Propiedades del Builder

          //? Condicion de diseño para el Grid

          //Si la tarjeta en el espacio 1 existe entonces :
          if (index == 1) {
            //Utilizamos una columna para que se vea algo desordenado
            return Column(
              children: [
                //Colocamos un espacio de 40 px
                const SizedBox(height: 40),
                //Llamamos a nuestras películas del ?Widget apartado
                MoviePosterLink(movie: widget.movies[index]),
              ],
            );
          }

          //Widget builder - Creamos un Widget aparte llamado "MoviePosterLink"
          return MoviePosterLink(movie: widget.movies[index]);
        },
      ),
    );
  }
}

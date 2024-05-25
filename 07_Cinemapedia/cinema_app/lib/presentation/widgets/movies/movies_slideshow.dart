//Importaciones flutter
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';

//Creamos la clase -
class MovieSlideshow extends StatelessWidget {
  //Propiedades de la clase

  //?Necesitamos llamar al listado de películas
  final List<Movie> movies;

  //Constructor
  const MovieSlideshow({super.key, required this.movies});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Utilizamos un SizeBox porque queremos asignarle un espacio determinado
    return SizedBox(
      //Le asginamos un alto de 210 pixeles
      height: 210,
      //Le asignamos un ancho double, para que ocupe todo el espacio disponible.
      width: double.infinity,

      //Llamamos a nuestro Swiper del paquete que instalamos
      child: Swiper(
        // Establece el tamaño de cada tarjeta en relación con el ancho de la pantalla.
        viewportFraction: 0.8,
        // Controla la escala de las tarjetas que no están en foco.
        scale: 0.9,
        // Habilita la reproducción automática del carrusel.
        autoplay: true,
        //Llamamos al largo de nuestras películas
        itemCount: movies.length,
        // Utilizamos itemBuilder par optimizar el rendimiento al crear listas grandes o infinitas,
        //ya que solo se construyen los elementos que son visibles en la pantalla en un momento dado
        itemBuilder: (context, index) =>
            //Propiedades del itemBuilder
            //Dentro del itemBuilder, se están realizando varias operaciones:

            //[Index]Se está obteniendo un objeto de película de la lista de películas.

            _SlideView(movie: movies[index]),
      ),
    );
  }
}

//Creamos un Widgets
class _SlideView extends StatelessWidget {
  //Propiedades de la clase

  //?Creamos una propiedad que nos permita llamar a nuestras peliculas
  final Movie movie;

  //Constructor
  const _SlideView({required this.movie});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //Widget
    return const Placeholder();
  }
}

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

    //?Cremaos una propiedad para la decoración del carrusel
    final decoration = BoxDecoration(
      //Agregamos un borde redondeado circular
      borderRadius: BorderRadius.circular(20),
      //Las sombras que tiene la tarjea
      boxShadow: const [
        BoxShadow(
            color: Colors.black45,
            //difuminación de la sombra
            blurRadius: 10,
            //Lugares de x - y donde queremos mover las sombras
            offset: Offset(0, 10)),
      ],
    );

    //Widget
    return Padding(
      //Colocamos un espacio entre el carrusel y nuestra barra
      padding: const EdgeInsets.only(bottom: 30),
      //Le agregamos una decoración al carrusel
      child:
          //Asignamos una decoración
          DecoratedBox(
        //Llamamos a nuestra variable
        decoration: decoration,
        //Utilizamos ClipRRect para que tenga un redondeado bonito la tarjeta
        child: ClipRRect(
          //Le agregamos el borde
          borderRadius: BorderRadius.circular(20),
          //Utilizando image.network llamamos a la imagen de nuestro path
          child: Image.network(
            //Llamamos a la imagen que representa la película con el backdrophat.
            movie.backdropPath,
            //Le asignamos un fit . cover para que tome el espacio que le estamos dando a la aplicación
            fit: BoxFit.cover,
            //Agregamos un loading - que nos ayudará a saber si la imagen se construyo o no
            loadingBuilder: (context, child, loadingProgress) {
              //Si la imagen no esta cargando
              if (loadingProgress != null) {
                return const DecoratedBox(
                    //Nos muestra un contenedor oscuro
                    decoration: BoxDecoration(color: Colors.black12));
              }
              //si la imagen ya cargo, muestra la imagen
              return child;
            },
          ),
        ),
      ),
    );
  }
}

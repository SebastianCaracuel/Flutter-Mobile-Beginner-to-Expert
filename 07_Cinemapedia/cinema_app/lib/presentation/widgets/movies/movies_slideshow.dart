//Importaciones flutter
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/entities.dart';
import 'package:go_router/go_router.dart';

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

    //?Listado de nuestros colores
    final colors = Theme.of(context).colorScheme;

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
        //Veemos los puntitos de navegación - con SwiperPagination
        pagination: SwiperPagination(
          //Le damos un margin o le quitamos el margin para que no este tan junto los puntos con el slider
          margin: const EdgeInsets.only(top: 0),
          //DotSwiperPaginationBuilder se utiliza para personalizar la apariencia de la paginación (los puntos indicadores) en un carrusel.
          builder: DotSwiperPaginationBuilder(
            //Color utilizando nuestra paleta de colores
            activeColor: colors.primary,
            //También utilizamos el color secundario
            color: colors.secondary,
            //
          ),
        ),
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
          //Utilizamos un detector de gestos
          child: GestureDetector(
            //todo: función de navegación
            onTap: () => context.push('/home/0/movie/${movie.id}'),
            //Si la imagen no esta, colocamos una imagen de carga, y le añadimos una animación
            child: FadeInImage(
                //rellenamos o extendimos la imagen
                fit: BoxFit.cover,
                placeholder:
                    //le asingamos la imagen de carga
                    const AssetImage('assets/loaders/bottle-loader.gif'),
                //Si ya cargo, colocamos la imagen de la película.
                image: NetworkImage(movie.backdropPath)),
          ),
        ),
      ),
    );
  }
}

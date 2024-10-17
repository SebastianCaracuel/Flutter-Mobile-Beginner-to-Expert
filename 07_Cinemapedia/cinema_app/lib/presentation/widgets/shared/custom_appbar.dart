//Importaciones Flutter
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/delegates/search_movies_delegate.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/domain/entities/entities.dart';

//?Creamos un Appbar personalizado
class CustomAppbar extends ConsumerWidget {
  //Propiedades de la clase

  //Constructor
  const CustomAppbar({super.key});

  //Objeto
  @override
  Widget build(BuildContext context, ref) {
    //Propiedades del objeto

    //?Llamamos el color que asignamos en nuestro tema para la aplicación
    final colors = Theme.of(context).colorScheme;

    //?Le asignamos un estilo al titulo
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    //?
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    //Creamos un SafeArea para que nuestro AppBar no choque con el Notch
    return SafeArea(
      //Asignamos un padding horizontal para que nuestros iconos o texto no estén tan pegados al costado
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        //Creamos un SizeBox que contendrá el interior de nuestro Appbar
        child: SizedBox(
          //Utilizamos un double.infinity que se utiliza para hacer que un widget ocupe todo el ancho disponible en su contenedor padre.
          width: double.infinity,

          //Llamamos a un row para hacer filas en forma horizontal
          child: Row(
            //Aquí debemos colocar las filas
            children: [
              //todo:Colocamos un Icono que será distintitvo como el (Logo) de la app
              Icon(
                  //Icono utilizado
                  Icons.movie_filter_outlined,
                  //Llamamos al color que colocamos en nuestor tema de la aplicación
                  color: colors.primary),

              //Utilizamos un sizebox para un pequeño espacio horizontal
              const SizedBox(width: 5),

              //todo:Colocamos el "Nombre de la aplicación" con un text
              Text(
                  //Nombre
                  'Cinemapedia',
                  //Le agregamos un estilo al texto
                  style: titleStyle),

              //?"Spacer" es un widget que se utiliza para agregar espacio flexible entre otros widgets dentro de un layout.
              //Básicamente, actúa como un resorte que empuja o estira los elementos adyacentes según el espacio disponible en la pantalla.
              const Spacer(),

              //todo:Agregamos un botón de busqueda, que será para filtrar o buscar las películas
              IconButton(
                  //Función del botón
                  onPressed: () {
                    //?Creamos una variable que llame a nuestra referencia de nuestro provider

                    final searchedMovies = ref.read(searchedMoviesProvider);

                    //?Implementamos nuestro provider de busqueda
                    final searchQuery = ref.read(searchQueryProvider);

                    // Se llama a la función showSearch cuando se presiona el botón (Función de flutter)
                    showSearch<Movie?>(
                      //?Llamamos al provider de buscar
                      query: searchQuery,
                      // Se pasa el contexto actual de la aplicación a la función showSearch.
                      context: context,
                      // Se pasa el delegado de búsqueda personalizado para manejar la lógica y presentación de la búsqueda.
                      delegate: SearchMovieDelegate(
                          initialMovies: searchedMovies,
                          // Llamamos a la referencia, utilizando el método buscar películas
                          searchMovies: ref
                              .read(searchedMoviesProvider.notifier)
                              .searchMoviesByQuery),
                    ).then((movie) {
                      //Condición
                      if (movie == null) return;

                      context.push('/home/0/movie/${movie.id}');
                    });
                  },

                  //Icono del botón
                  icon: const Icon(Icons.search)),

              //todo: Agregamos otro botón que será un menu lateral
              IconButton(
                  //Función del botón
                  onPressed: () {
                    ref
                        .read(isDarkModeProvider.notifier)
                        .update((state) => !state);
                  },
                  //Icono del botón
                  icon: Icon(isDarkMode
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded)),
            ],
          ),
        ),
      ),
    );
  }
}

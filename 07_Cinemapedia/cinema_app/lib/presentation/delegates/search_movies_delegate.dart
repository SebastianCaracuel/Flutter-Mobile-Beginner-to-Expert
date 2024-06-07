//Importaciones flutter

import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:animate_do/animate_do.dart';

//?Creamos un tipo de función especifíca
typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

//Creamos una clase
class SearchMovieDelegate extends SearchDelegate<Movie?> {
  //?Definimos una función para buscar las películas
  final SearchMoviesCallBack searchMovies;
  //Constructor con la función
  SearchMovieDelegate({required this.searchMovies});

  // Esta propiedad sobreescribe el texto del marcador de posición (placeholder)
  // del campo de búsqueda. Cuando el usuario ve el campo de búsqueda vacío,
  // verá "search movie" en lugar del texto por defecto (search). Esto ayuda a indicar
  // claramente al usuario que puede buscar películas.
  @override
  String get searchFieldLabel => "search movie";

  // Este método construye las acciones para el AppBar en la pantalla de búsqueda.
  // Normalmente, incluiría widgets como un botón para limpiar la búsqueda.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // El widget FadeIn anima su hijo (child) cuando su propiedad `animate` es verdadera.
      FadeIn(
        // La animación solo se activa si la consulta (query) no está vacía.
        animate: query.isNotEmpty,
        // Duración de la animación (200 milisegundos).
        duration: const Duration(milliseconds: 200),
        // El hijo del FadeIn es un IconButton.
        child: IconButton(
          // Cuando se presiona el botón, la consulta se borra (se establece en una cadena vacía).
          onPressed: () => query = '',
          // El icono mostrado en el botón es un ícono de limpiar (clear).
          icon: const Icon(Icons.clear),
        ),
      ),
    ];
  }

  // Este método construye el widget que aparece al principio del AppBar,
  // como un botón de retroceso para cerrar la búsqueda.
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      // Utilizamos un Onpressed para ir "hacia atras" la pagina principal
      // En este caso, se llama a `close` para cerrar la búsqueda y se pasa `null` como resultado.
      onPressed: () => close(context, null),
      // El icono mostrado en el botón es una flecha hacia atrás.
      icon: const Icon(Icons.arrow_back),
    );
  }

  // Este método construye los resultados de la búsqueda basados en la consulta del usuario.
  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  // Este método construye las sugerencias que se muestran mientras el usuario escribe.
  // Puede mostrar una lista de sugerencias o resultados previos.
  @override
  Widget buildSuggestions(BuildContext context) {
    // FutureBuilder se usa para construir widgets basados en el resultado de un Future.
    return FutureBuilder(
      // El Future que se está esperando, que en este caso es el resultado de buscar películas
      // basado en la consulta actual (query).
      future: searchMovies(query),
      // El constructor del FutureBuilder, que se llama cada vez que el Future cambia de estado.
      builder: (context, snapshot) {
        // Si snapshot.data es nulo, se asigna una lista vacía a películas.
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
          ),
        );
      },
    );
  }
}

//Creamos un Widget para mostrar las películas

class _MovieItem extends StatelessWidget {
  //Propiedades de la clase

  //?Llamamos a nuetra película
  final Movie movie;

  //Constructor
  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //?Creamos una variable para utilizar cierto estilo de texto
    final textStyles = Theme.of(context).textTheme;
    //?Creamos una variable para ver las dimensiones del movil
    final size = MediaQuery.of(context).size;

    return Padding(
      //Asignamos un paddgin para que tenga una separación los objetos
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      //Utilizamos un Row para tener objetos en horizontal
      child: Row(
        children: [
          //Imagen

          //?Para la imagen necesito un tamaño especifico porque estoy dentro de un row
          //?Utilizamos un SizeBox para ese
          SizedBox(
            width: size.width * 0.2,
            //Utilizamos un ClipRRect para que la imagen tenga bordes redondeados
            child: ClipRRect(
              //Le añadimos el borde radius
              borderRadius: BorderRadius.circular(20),
              //Llamamos la imagen de nuestra entidad película
              child: Image.network(
                movie.posterPath,
                //Creamos una animación en cargado (Mostrar las películas si no estan cargadas con una animación)
                loadingBuilder: (context, child, loadingProgress) =>
                    FadeIn(child: child),
              ),
            ),
          )

          //Descripción de la película
        ],
      ),
    );
  }
}

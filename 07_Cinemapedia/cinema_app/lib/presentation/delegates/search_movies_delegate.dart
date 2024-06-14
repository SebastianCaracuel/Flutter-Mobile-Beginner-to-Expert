//Importaciones flutter
import 'package:flutter/material.dart';
import 'dart:async';

//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/config/helpers/human_formats.dart';
import 'package:animate_do/animate_do.dart';

//?Creamos un tipo de función especifíca
typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

//Creamos una clase
class SearchMovieDelegate extends SearchDelegate<Movie?> {
  //?Definimos una función para buscar las películas
  final SearchMoviesCallBack searchMovies;

  //Creamos una lista de peliculas
  List<Movie> initialMovies;

  //?Creamos una variable de stream
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();

  //?Creamos una variable que nos permita determinar un periodo de tiempo
  Timer? _debounceTimer;

  //Constructor con la función
  SearchMovieDelegate(
      {required this.searchMovies, required this.initialMovies});

// ? Creamos un Método para limpiar y cerrar el stream
  void clearStreams() {
    debouncedMovies.close(); // Cerramos el stream debouncedMovies
  }

  //?Creamos un metodo vacio para cuando el query cambie
// Función encargada de emitir el nuevo resultado de las películas
  void _onQueryChanged(String query) {
    //! Esta función se llama cada vez que el usuario cambia el texto de búsqueda

    // Determinamos si el temporizador tiene un valor o está activo, y si lo está, lo cancelamos
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    // Creamos un nuevo temporizador que espera 500 milisegundos después de que el usuario deja de escribir
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      // Cuando el usuario deja de escribir por 500 milisegundos, se ejecuta esta función

      // Si la consulta de búsqueda está vacía, emitimos una lista vacía de películas
      // if (query.isEmpty) {
      //   debouncedMovies.add([]); // Agregamos una lista vacía al stream
      //   return; // Terminamos la ejecución de la función
      // }

      // Si la consulta no está vacía, buscamos películas usando la consulta
      final movies = await searchMovies(query);

      //Initialmovie
      initialMovies = movies;

      // Agregamos las películas encontradas al stream
      debouncedMovies.add(movies);
    });
  }

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
      onPressed: () {
        // Llamamos a la función clearStreams para cerrar el stream debouncedMovies
        clearStreams();
        // Cerramos el contexto actual (podría ser una página o un diálogo)
        close(context, null);
      },
      // El icono mostrado en el botón es una flecha hacia atrás.
      icon: const Icon(Icons.arrow_back),
    );
  }

  // Este método construye los resultados de la búsqueda basados en la consulta del usuario.
  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      //mostramos las películas que tenía en la ultima busqueda presionando enter
      initialData: initialMovies,
      //Luego tenemos la respuesta del stream
      stream: debouncedMovies.stream,

      // El constructor del StreamBuilder
      builder: (context, snapshot) {
        // Si snapshot.data es nulo, se asigna una lista vacía a películas.
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            //
            onMovieSelected: (context, movie) {
              // Llamamos a la función clearStreams para cerrar el stream debouncedMovies
              clearStreams();

              // Cerramos el contexto actual (como una página o diálogo) y devolvemos la película seleccionada
              close(context, movie);
            },
          ),
        );
      },
    );
  }

  // Este método construye las sugerencias que se muestran mientras el usuario escribe.
  // Puede mostrar una lista de sugerencias o resultados previos.
  @override
  Widget buildSuggestions(BuildContext context) {
    //Llamamos al método OnQueryChanged
    _onQueryChanged(query);

    // Cambiamos nuestro Future Builder por un Streambuilder
    return StreamBuilder(
      //Colocamos la iniciacion
      initialData: initialMovies,
      stream: debouncedMovies.stream,

      // El constructor del StreamBuilder
      builder: (context, snapshot) {
        //todo:!auí se realizará la petición

        // Si snapshot.data es nulo, se asigna una lista vacía a películas.
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(
            movie: movies[index],
            //
            onMovieSelected: (context, movie) {
              // Llamamos a la función clearStreams para cerrar el stream debouncedMovies
              clearStreams();

              // Cerramos el contexto actual (como una página o diálogo) y devolvemos la película seleccionada
              close(context, movie);
            },
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

  //?Recibimos una función que nos permite identificar cuando se selecciona una película.
  final Function onMovieSelected;

  //Constructor
  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //?Creamos una variable para utilizar cierto estilo de texto
    final textStyles = Theme.of(context).textTheme;
    //?Creamos una variable para ver las dimensiones del movil
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      //!Función de navegación
      onTap: () {
        //
        onMovieSelected(context, movie);
      },
      child: Padding(
        //Asignamos un paddgin para que tenga una separación los objetos
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //Utilizamos un Row para tener objetos en horizontal
        child: Row(
          children: [
            //todo: Imagen de la película
            //?Para la imagen necesito un tamaño especifico porque estoy dentro de un row
            //?Utilizamos un SizeBox para ese
            SizedBox(
              width: size.width * 0.2,
              //Utilizamos un ClipRRect para que la imagen tenga bordes redondeados
              child: ClipRRect(
                //Le añadimos el borde radius
                borderRadius: BorderRadius.circular(10),
                //Llamamos la imagen de nuestra entidad película
                child: Image.network(
                  movie.posterPath,
                  //Creamos una animación en cargado (Mostrar las películas si no estan cargadas con una animación)
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),

            //damos un espacio vertical de 10 pixeles para que exista una separación entre la imagen y la descripción
            const SizedBox(width: 10),

            //todo:Descripción de la película
            //?Utilizamos un Sizebox para tener un tamaño especifico del texto
            SizedBox(
              //Le añadimos un espacio determinado al Sizebox para mostrar el texto
              width: size.width * 0.7,
              //Utilizamos una columna para tener objetos en forma horizontal
              child: Column(
                //Queremos que todos nuestro objetos esten alineados y comiencen al principio
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Titulo de la película
                  Text(
                      //Llamamos al titulo de la película
                      movie.title,
                      //Le añadimos un estilo al titulo
                      style: textStyles.titleMedium),

                  //Reseña de la película
                  //?Controlamos todo el texto de las películas
                  // Evaluamos la longitud de la sinopsis de la película
                  (movie.overview.length > 100)
                      // Si la sinopsis tiene más de 100 caracteres
                      // Tomamos los primeros 100 caracteres de la sinopsis
                      // Añadimos '...' al final para indicar que el texto ha sido truncado
                      ? Text('${movie.overview.substring(0, 100)}...')
                      // Si la sinopsis tiene 100 caracteres o menos
                      // Mostramos la sinopsis completa sin truncar
                      : Text(movie.overview),

                  //Calificación de la película
                  //?Mostramos por pantalla la calíficación de las personas
                  Row(
                    children: [
                      //Colocamos el icono de la calificación en estrellas
                      Icon(
                          //Llamamos un icono de estrella
                          Icons.star_half_rounded,
                          //Y tendrá un color amaraillo no tan luminoso
                          color: Colors.yellow.shade800),

                      //Pequeña separación entre el icono y la descripción
                      const SizedBox(width: 5),

                      //Llamamos los votos mostrados en un texto
                      Text(
                        //Colocamos el HumanFormat para poder ver los números en un formato humano visible
                        HumanFormats.number(movie.voteAverage, 1),
                        //Le añadimos un estilo al texto
                        style: textStyles.bodyMedium!
                            .copyWith(color: Colors.yellow.shade900),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

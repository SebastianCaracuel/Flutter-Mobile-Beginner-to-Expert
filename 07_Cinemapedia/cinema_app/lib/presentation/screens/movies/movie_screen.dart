//Importaciones Flutter
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras

//Clase
class MovieScreen extends ConsumerStatefulWidget {
  //Propiedades

  //Nombre de la pantalla
  static const name = 'movie-screen';

  //?Definimos como propiedad el Id de una película.
  final String movieId;

  //Constructor
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

//State
class MovieScreenState extends ConsumerState<MovieScreen> {
  //State propiedades

// Se llama al initsate cuando el estado se inicializa
  @override
  void initState() {
    super.initState();

    // Usamos `ref` para leer el proveedor `movieInfoProvider` y cargar la película usando su ID
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades objeto

    // Utilizamos `ref` para observar el estado del proveedor `movieInfoProvider` y obtener la película con el ID especificado
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    // Si la película no está cargada (es nula), mostramos un indicador de carga
    if (movie == null) {
      return const Scaffold(
          body: Scaffold(
              body: Center(child: CircularProgressIndicator(strokeWidth: 4))));
    }

    //Widget padre
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MovieID: ${widget.movieId}')),
      ),
    );
  }
}

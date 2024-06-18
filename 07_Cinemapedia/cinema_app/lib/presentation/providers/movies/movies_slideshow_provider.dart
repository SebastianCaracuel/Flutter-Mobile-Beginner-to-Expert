//importaciones flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'movies_providers.dart';
import 'package:cinema_app/domain/entities/entities.dart';

//?Creamos un provider de solo lectura
final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  //?Llamamos a nuestro provider nowPlayinMovies
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  // si las peliculas se encuentra vacio
  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});

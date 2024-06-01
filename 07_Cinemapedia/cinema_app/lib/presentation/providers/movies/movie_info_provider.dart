// Importaciones de Flutter y paquetes relacionados
import 'package:cinema_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Importa flutter_riverpod, que es una biblioteca para la gestión del estado en Flutter

// Importaciones de nuestros propios módulos
import 'package:cinema_app/domain/entities/movie.dart'; // Importa la entidad Movie de nuestro dominio de la aplicación

//? Proveedor de estado para la información de la película
final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  // `ref` es una referencia proporcionada por Riverpod que permite acceder a otros proveedores y objetos dentro del árbol de widgets.
  final moviesRepository = ref.watch(
      movieRepositoryProvider); // Utiliza `ref.watch` para observar el proveedor de repositorio de películas y obtener su instancia actual.
  // Retorna una instancia de MovieMapNotifier, pasando el método getMovieID del repositorio.
  return MovieMapNotifier(getMovie: moviesRepository.getMovieID);
});

// Define un alias para un callback que recibe un ID de película y devuelve una Future<Movie>
typedef GetMovieCallback = Future<Movie> Function(String movieId);

// Creamos esta clase para tener una referencia que nos permita tener una clase que guarde en caché las películas.
class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  // Propiedades
  final GetMovieCallback
      getMovie; // Definimos una propiedad para el callback que obtendrá la película

  // Constructor
  // Recibe el callback getMovie como parámetro requerido y inicializa el estado con un mapa vacío
  MovieMapNotifier({required this.getMovie}) : super({});

  // Método para cargar una película
  Future<void> loadMovie(String movieId) async {
    // Verifica si la película ya está en el estado (caché) para evitar volver a cargarla
    if (state[movieId] != null) return;

    // Si la película no está en caché, llama al callback getMovie para obtenerla
    final movie = await getMovie(movieId);

    // Actualiza el estado añadiendo la nueva película al mapa
    state = {...state, movieId: movie};
  }
}

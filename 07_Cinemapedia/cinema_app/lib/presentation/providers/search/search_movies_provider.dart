//Importaciones flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';

// ? Crearemos un provider para la busqueda activa de nuestra aplicación
final searchQueryProvider = StateProvider<String>((ref) => '');

// ?Definimos un proveedor de estado que usa SearchedMoviesNotifier para manejar una lista de películas
final searchedMoviesProvider =
    StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref) {
  // Leemos el proveedor movieRepositoryProvider para obtener el repositorio de películas
  final movieRepository = ref.read(movieRepositoryProvider);

  // Retornamos una instancia de SearchedMoviesNotifier
  // Inicializamos con ref y la función de búsqueda de películas del repositorio
  return SearchedMoviesNotifier(
      ref: ref, searchMovies: movieRepository.searchMovies);
});

// Definimos el Typedef porque realizaremos una función personalizada
typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

// Clase SearchedMoviesNotifier que extiende StateNotifier y maneja una lista de películas
class SearchedMoviesNotifier extends StateNotifier<List<Movie>> {
  // Propiedad de la clase
  final SearchMoviesCallback searchMovies; // Callback para buscar películas
  final Ref
      ref; // Referencia para leer y actualizar otros proveedores de estado

  // Constructor con lista vacía
  SearchedMoviesNotifier({required this.ref, required this.searchMovies})
      : super([]);

  // Método que va a regresar la lista de películas basadas en la consulta
  Future<List<Movie>> searchMoviesByQuery(String query) async {
    // Obtenemos la lista de las películas usando el callback searchMovies
    final List<Movie> movies = await searchMovies(query);

    // Actualizamos el estado del proveedor searchQueryProvider con la nueva consulta
    ref.read(searchQueryProvider.notifier).update((state) => query);

    // Actualizamos el estado con la lista de películas obtenidas
    state = movies;

    // Devolvemos la lista de películas
    return movies;
  }
}

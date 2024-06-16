//Importacione Flutter

//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';

// Creamos una clase abstracta llamada LocalStorageDatasource
abstract class LocalStorageDatasource {
  // Método abstracto para alternar el estado de favorito de una película
  Future<void> toggleFavorite(Movie movie);

  // Método abstracto para verificar si una película es favorita por su ID
  Future<bool> isMovieFavorite(int movieId);

  // Método abstracto para cargar una lista de películas con un límite y un desplazamiento opcionales
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}

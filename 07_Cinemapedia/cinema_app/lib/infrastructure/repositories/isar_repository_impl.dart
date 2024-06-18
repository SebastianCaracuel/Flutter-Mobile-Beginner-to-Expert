//Importaciones Flutter

// Importaciones Nuestras
import 'package:cinema_app/domain/entities/entities.dart'; // Importa la clase Movie desde nuestro dominio de entidades
import 'package:cinema_app/domain/datasources/local_storage_datasource.dart'; // Importa la interfaz LocalStorageDatasource
import 'package:cinema_app/domain/repositories/local_storage_repositories.dart'; // Importa la interfaz LocalStorageRepository

// Definimos la clase LocalStorageRepositoryImpl que implementa LocalStorageRepository
class LocalStorageRepositoryImpl extends LocalStorageRepository {
  // Declaramos una variable final de tipo LocalStorageDatasource
  final LocalStorageDatasource datasource;

  // Constructor que inicializa la variable datasource
  LocalStorageRepositoryImpl(this.datasource);

  // Implementación del método isMovieFavorite, llama al método correspondiente en el datasource
  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  // Implementación del método loadMovies, llama al método correspondiente en el datasource
  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  // Implementación del método toggleFavorite, llama al método correspondiente en el datasource
  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}

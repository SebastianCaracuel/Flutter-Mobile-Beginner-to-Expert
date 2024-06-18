//Importaciones Flutter
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
//Importaciones Nuestas

import 'package:cinema_app/domain/datasources/local_storage_datasource.dart';
import 'package:cinema_app/domain/entities/entities.dart';

//
class IsarDatasoruce extends LocalStorageDatasource {
  // Declaramos una variable tardía que contendrá el Future de la base de datos Isar
  late Future<Isar> db;

  // Constructor que inicializa la variable db llamando al método openDB
  IsarDatasoruce() {
    db = openDB();
  }
  // Método que abre la base de datos Isar y retorna un Future de Isar
  Future<Isar> openDB() async {
    // Obtiene el directorio de documentos de la aplicación
    final dir = await getApplicationDocumentsDirectory();

    // Si no hay instancias de Isar abiertas, abre una nueva con el esquema de Movie y el inspector habilitado
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([MovieSchema],
          inspector: true, directory: dir.path);
    }
    // Si ya existe una instancia, la devuelve
    return Future.value(Isar.getInstance());
  }

  // ? Sobrescribimos el método isMovieFavorite para comprobar si una película es favorita
  @override
  Future<bool> isMovieFavorite(int movieId) async {
    // Espera a que el Future de la base de datos Isar se resuelva y obtiene la instancia de Isar
    final isar = await db;

    // Busca la primera película en la base de datos que tenga el id igual a movieId
    final Movie? isFavoriteMovie = await isar.movies
        // Aplica un filtro para encontrar la película con el id especificado
        .filter()
        .idEqualTo(movieId)
        // Encuentra la primera coincidencia en la base de datos
        .findFirst();

    // Retorna true si isFavoriteMovie no es nulo (la película fue encontrada), false en caso contrario
    return isFavoriteMovie != null;
  }

  // ? Sobrescribimos el método toggleFavorite para alternar el estado de favorito de una película
  @override
  Future<void> toggleFavorite(Movie movie) async {
    // Esperamos a que la base de datos esté lista
    final isar = await db;

    // Busca la primera película en la base de datos que tenga el id igual a movie.id
    final favoriteMovie = await isar.movies
        // Aplica un filtro para encontrar la película con el id especificado
        .filter()
        .idEqualTo(movie.id)
        // Encuentra la primera coincidencia en la base de datos
        .findFirst();

    // Si la película fue encontrada, se elimina de la lista de favoritos
    if (favoriteMovie != null) {
      // Borrar la película usando una transacción síncrona
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }

    // Si la película no fue encontrada, se inserta en la lista de favoritos
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

// Sobrescribimos el método loadMovies para cargar una lista de películas
  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    // Espera a que el Future de la base de datos Isar se resuelva y obtiene la instancia de Isar
    final isar = await db;

    // Realiza una consulta en la colección de películas con el desplazamiento y el límite especificados
    return isar.movies
        .where()
        // Aplica un desplazamiento para saltar las primeras 'offset' películas
        .offset(offset)
        // Aplica un límite para restringir el número de películas devueltas a 'limit'
        .limit(limit)
        // Recupera todas las películas que cumplen con estos criterios
        .findAll();
  }
}

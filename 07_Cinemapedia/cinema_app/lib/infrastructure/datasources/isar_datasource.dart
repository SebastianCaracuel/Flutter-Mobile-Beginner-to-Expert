//Importaciones Flutter
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
//Importaciones Nuestas

import 'package:cinema_app/domain/datasources/local_storage_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';

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

  @override
  Future<bool> isMovieFavorite(int movieId) {
    // TODO: implement isMovieFavorite
    throw UnimplementedError();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    // TODO: implement toggleFavorite
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    // TODO: implement loadMovies
    throw UnimplementedError();
  }
}

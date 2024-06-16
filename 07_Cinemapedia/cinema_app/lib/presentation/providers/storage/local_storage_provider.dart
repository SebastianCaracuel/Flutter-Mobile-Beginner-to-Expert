//Importaciones Flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'package:cinema_app/infrastructure/datasources/isar_datasource.dart';
import 'package:cinema_app/infrastructure/repositories/isar_repository_impl.dart';

final localStorageRepositoryProvider = Provider((ref) {
  // Crea y devuelve una instancia de LocalStorageRepositoryImpl
  // utilizando una instancia de IsarDatasoruce.
  // Este proveedor se encargará de gestionar esta instancia
  // y permitir su acceso en cualquier parte de la aplicación.
  return LocalStorageRepositoryImpl(IsarDatasoruce());
});

// Definimos un FutureProvider.family que puede aceptar un parámetro (movieId)
final isFavoriteProvider =
    FutureProvider.family.autoDispose((ref, int movieId) {
  // Observa el proveedor localStorageRepositoryProvider para obtener la instancia de LocalStorageRepositoryImpl
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  // Llama al método isMovieFavorite en localStorageRepository con el movieId y devuelve el resultado (un Future<bool>)
  return localStorageRepository.isMovieFavorite(movieId);
});

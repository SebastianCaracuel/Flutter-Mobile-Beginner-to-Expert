//Importacion flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones nuestras
import 'package:cinema_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinema_app/infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  //
  return MovieRepositoryImpl(MoviedbDatasource());
});

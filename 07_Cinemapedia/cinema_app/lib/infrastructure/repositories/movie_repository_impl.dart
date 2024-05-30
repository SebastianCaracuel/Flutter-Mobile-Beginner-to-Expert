//Importaciones de flutter

//Importaciones nuestras

import 'package:cinema_app/domain/datasources/movies_datasources.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/domain/repositories/movies_repositories.dart';

//Clase de la implementación del repositorio
class MovieRepositoryImpl extends MoviesRepository {
  //Propiedades de la clase

  //Llamamos al datasource
  final MoviesDatasource datasource;
  //Implementamos el constructor del datasource
  MovieRepositoryImpl(this.datasource);

  //Objeto - Override
  @override
  Future<List<Movie>> getNoPlaying({int page = 1}) {
    //Propiedades del objeto

    //Implementación del repositorio - llamamos el getNoPlayin basado en el datasource
    return datasource.getNoPlaying(page: page);
  }

  //todo:Películas populares
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  //todo: Películas en el Ranking
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  //todo: Películas en camino
  @override
  Future<List<Movie>> getUpcomming({int page = 1}) {
    return datasource.getUpcomming(page: page);
  }
}

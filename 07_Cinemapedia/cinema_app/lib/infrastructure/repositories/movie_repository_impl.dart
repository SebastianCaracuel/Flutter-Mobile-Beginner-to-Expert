//Importaciones de flutter

//Importaciones nuestras

import 'package:cinema_app/domain/datasources/movies_datasources.dart';
import 'package:cinema_app/domain/entities/entities.dart';
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

  //todo: Obtener el ID de la película
  @override
  Future<Movie> getMovieID(String id) {
    //Llamamos al datasource con el metodo que creamos de obtener el ID
    return datasource.getMovieID(id);
  }

  //todo: Buscamos una o varias películas
  @override
  Future<List<Movie>> searchMovies(String query) {
    //
    return datasource.searchMovies(query);
  }

  //todo: Buscamos una las películas similares
  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return datasource.getSimilarMovies(movieId);
  }

  //todo: Buscamos los trailers en youtube de las películas
  @override
  Future<List<Video>> getYotubeVideosById(int movieId) {
    return datasource.getYotubeVideosById(movieId);
  }
}

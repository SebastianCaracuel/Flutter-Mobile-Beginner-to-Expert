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
}

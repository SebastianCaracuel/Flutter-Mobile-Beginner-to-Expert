//Importaciones Flutter
import 'package:dio/dio.dart';

//Importaciones nuestras
import 'package:cinema_app/domain/datasources/movies_datasources.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/config/constants/environment.dart';
import 'package:cinema_app/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinema_app/infrastructure/mappers/movie_mapper.dart';

//Clase para obtener las películas

class MoviedbDatasource extends MoviesDatasource {
  //Propiedades

  //?Gestor de peticiones HTTP (Dio)
  final dio = Dio(
      //Configuramos nuestro cliente HTTP para TheMovieDB
      BaseOptions(
          //cuando yo utilice la instancía todas las peticiones van a tener una base URL pre configurada
          baseUrl: 'https://api.themoviedb.org/3',
          //Llamamos a los parametros
          queryParameters: {
        //Configuramos la API Key
        'api_key': Environment.movieDBKey,
        //Configuramos el lenguaje que queremos traer
        'language': 'es-MX',
      }));

  //Objeto
  @override
  Future<List<Movie>> getNoPlaying({int page = 1}) async {
    //Propiedades del objeto

    //?Configuramos nuestra URL para llamar a las peliculas
    final response = await dio.get('/movie/now_playing',
        //Agregamos las nuevas películas
        queryParameters: {'page': page});

    //Mapeo de la respuesta
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    //Necesito un listado de peliculas - LLamamos a las peliculas
    final List<Movie> movies = movieDBResponse.results
        //Realizamos un filtro si no tiene un poster
        .where((moviedb) => moviedb.posterPath != 'NO-POSTER')
        //Mapeamos los datos
        .map(
            //llamamos a las peliculas
            (moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    //Retornamos las peliculas
    return movies;
  }
}

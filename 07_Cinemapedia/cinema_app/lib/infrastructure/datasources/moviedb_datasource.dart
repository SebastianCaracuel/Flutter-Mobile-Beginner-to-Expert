//Importaciones Flutter
import 'package:cinema_app/infrastructure/models/moviedb/movie_details.dart';
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

  //todo: creamos un metódo
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    //Mapeo de la respuesta
    final movieDBResponse = MovieDbResponse.fromJson(json);

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

  //Objeto
  @override
  Future<List<Movie>> getNoPlaying({int page = 1}) async {
    //Propiedades del objeto

    //?Configuramos nuestra URL para llamar a las peliculas
    final response = await dio.get('/movie/now_playing',
        //Agregamos las nuevas películas
        queryParameters: {'page': page});
    //Llamamos al metódo que creamos
    return _jsonToMovies(response.data);
  }

  //todo: Películas Populares
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    //Propiedades del objeto

    //?Configuramos nuestra URL para llamar a las peliculas
    final response = await dio.get('/movie/popular',
        //Agregamos las nuevas películas
        queryParameters: {'page': page});

    //Llamamos al metódo que creamos
    return _jsonToMovies(response.data);
  }

  //todo: Ranking de películas
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    //Propiedades del objeto

    //?Configuramos nuestra URL para llamar a las peliculas
    final response = await dio.get('/movie/top_rated',
        //Agregamos las nuevas películas
        queryParameters: {'page': page});

    //Llamamos al metódo que creamos
    return _jsonToMovies(response.data);
  }

//todo: Películas en camino
  @override
  Future<List<Movie>> getUpcomming({int page = 1}) async {
    //Propiedades del objeto

    //?Configuramos nuestra URL para llamar a las peliculas
    final response = await dio.get('/movie/upcoming',
        //Agregamos las nuevas películas
        queryParameters: {'page': page});

    //Llamamos al metódo que creamos
    return _jsonToMovies(response.data);
  }

  //todo: Obtener le ID de la película
  @override
  Future<Movie> getMovieID(String id) async {
//Propiedades del objeto

    //?Configuramos nuestra URL para llamar a el id de la película
    final response = await dio.get('/movie/$id');

    //validamos la respuesta
    if (response.statusCode != 200) {
      //Si la película no existe, coloca "la pelicula con el ID no se ha encontrado"
      throw Exception('Movie with id: $id not found');
    }

    //decodificmaos la respuesta JSON y la convertimos en un objeto "movieDetails"
    final movieDetails = MovieDetails.fromJson(response.data);
    //Mapeamos el objeto Moviedetails
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    //Retornamos la película
    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    //?Configuramos nuestra URL para buscar las películas
    final response = await dio.get('/search/movie',
        //Agregamos las nuevas películas
        queryParameters: {'query': query});

    //Llamamos al metódo que creamos
    return _jsonToMovies(response.data);
  }

  //todo: Buscar película o películas
}

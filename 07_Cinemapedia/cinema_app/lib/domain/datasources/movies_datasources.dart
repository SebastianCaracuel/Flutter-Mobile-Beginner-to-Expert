//Importaciones de Flutter

//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';

//Creamos una clase abstracta //?Es abstracta porque no quiero crear instancias de movie

abstract class MoviesDatasource {
  //Definimos como lucen los origines de datos que puede traer la API

  //?Traeme las peliculas que están en cartelera -
  //?La información de retorno va a ser un Future que regresa una lista de la entidad
  Future<List<Movie>> getNoPlaying(
      {int page = 1}); //Necesito que me especifique la pagina

  //?Películas populares
  Future<List<Movie>> getPopular({int page = 1});

  //?Películas Ranking
  Future<List<Movie>> getTopRated({int page = 1});

  //?Películas comming soon
  Future<List<Movie>> getUpcomming({int page = 1});

  //?ID de la película - Creamos un metodo para que podamos llamar el ID de las películas
  Future<Movie> getMovieID(String id);

  //?Creamos el metodo para buscar películas
  Future<List<Movie>> searchMovies(String query);

  //?Creamos el método para las películas similares
  Future<List<Movie>> getSimilarMovies(int movieId);

  //?Creamos el método para que tengamos videos de trailer en nuestras películas
  Future<List<Movie>> getYotubeVideosById(int movieId);
}

//Importaciones de Flutter

//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';

//Creamos una clase abstracta //?Es abstracta porque no quiero crear instancias de movie

abstract class MovieDatasource {
  //Definimos como lucen los origines de datos que puede traer la API

  //?Traeme las peliculas que están en cartelera -
  //?La información de retorno va a ser un Future que regresa una lista de la entidad
  Future<List<Movie>> getNoPlaying(
      {int page = 1}); //Necesito que me especifique la pagina
}
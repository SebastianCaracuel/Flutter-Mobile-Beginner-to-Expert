//IMportaciones flutter
import 'package:dio/dio.dart';

//Importaciones nuestras
import 'package:cinema_app/domain/datasources/actors_datasources.dart';
import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/config/constants/environment.dart';
import 'package:cinema_app/infrastructure/models/moviedb/credits_response.dart';
import 'package:cinema_app/infrastructure/mappers/actor_mapper.dart';

//Creamos el datasource de la insfrastructura del actor

class ActorMovieDbDatasource extends ActorsDatasource {
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

  //
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    //Obtenemos los actores
    final response = await dio.get('/movie/$movieId/credits');

    //Creamos un objeto que tiene cada una de las propiedades del modelo
    final castResponse = CreditsResponse.fromJson(response.data);

    //Lo convertimos en una lista a los actores
    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    //Retornamos la lista
    return actors;
  }
}

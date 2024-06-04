//Importaciones de Flutter

//Importaciones nuestras
import 'package:cinema_app/domain/entities/actor.dart';

//Creamos una clase abstracta //?Es abstracta porque no quiero crear instancias de movie

abstract class ActorsDatasource {
  //?Definimos las reglas para trabajar con el datasources
  Future<List<Actor>> getActorsByMovie(String movieId);
}

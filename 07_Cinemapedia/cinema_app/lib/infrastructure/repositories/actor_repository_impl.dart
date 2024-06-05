//Importaciones flutter

//Importaciones Nuestras
import 'package:cinema_app/domain/datasources/actors_datasources.dart';
import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/domain/repositories/actors_repositories.dart';

//Creamos una clase para nuestro repositorio que llamara al datasource

class ActorRepositoryImpl extends ActorsRepository {
  //Propiedades de la clase

  //?Llamamos al datasource del actor
  final ActorsDatasource datasource;

  //Constructor de la clase
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    //Propiedades del metodo obtener actores

    //Implementamos el datasources y el metodo para obtener los datos
    return datasource.getActorsByMovie(movieId);
  }
}

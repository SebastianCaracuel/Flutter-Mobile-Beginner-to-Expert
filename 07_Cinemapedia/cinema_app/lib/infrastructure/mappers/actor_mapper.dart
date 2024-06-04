//Importaciones flutter

//IMportaciones nuestras
import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/infrastructure/models/moviedb/credits_response.dart';

//Creamos una clase para mappear los datos
class ActorMapper {
  //
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
            : 'https://painrehabproducts.com/wp-content/uploads/2014/10/facebook-default-no-profile-pic.jpg',
        character: cast.character,
      );
}

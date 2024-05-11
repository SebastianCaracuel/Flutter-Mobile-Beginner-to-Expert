//Creamos una clase abstracta

import 'package:toktik_app/domain/entities/video_post.dart';

abstract class VideoPostDatasource {
  //Metodos

  //Importamos nuestra lista de videoPost
  Future<List<VideoPost>> getTrandinVideosByPage(int page);

  //Cargamos los videos favoritos del usuario
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID);
}

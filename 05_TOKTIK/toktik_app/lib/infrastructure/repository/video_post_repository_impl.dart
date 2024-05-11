import 'package:toktik_app/domain/datasources/video_post_datasource.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/domain/repositories/video_post_repository.dart';

//Creamos la clase

class VideoPostsRepository implements VideoPostRepository {
  //Traemos nuestra fuente de datos
  final VideoPostDatasource videosDatasource;

  VideoPostsRepository({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrandinVideosByPage(int page) {
    //Implementación para llamar al Datasource
    return videosDatasource.getTrandinVideosByPage(page);
  }
}

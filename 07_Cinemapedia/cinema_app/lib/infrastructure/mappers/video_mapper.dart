//Importaciones Flutter

//IMportaciones nuestras
import 'package:cinema_app/domain/entities/entities.dart';
import 'package:cinema_app/infrastructure/models/models.dart';

//Creamos una clase para el video y lo podamos mapear
class VideoMapper {
  static moviedbVideoToEntity(Result moviedbVideo) => Video(
      id: moviedbVideo.id,
      name: moviedbVideo.name,
      youtubeKey: moviedbVideo.key,
      publishedAt: moviedbVideo.publishedAt);
}

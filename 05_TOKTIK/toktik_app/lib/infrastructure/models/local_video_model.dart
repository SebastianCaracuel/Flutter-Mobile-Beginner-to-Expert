import 'package:toktik_app/domain/entities/video_post.dart';

//El modelo de datos para mapear el local video post.

//Creamos la clase para nuestro Modelo

class LocalVideoModel {
  //PROPIEDADES

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  //Creamos le Constructor con las propiedades
  LocalVideoModel(
      {required this.name,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  //Recibimos los datos por un mapa tipo JSON
  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'] ?? 'No video Name',
        videoUrl: json['videoUrl'],
        likes: json['likes'] ?? 0,
        views: json['view'] ?? 0,
      );

  //ToEntity
  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: videoUrl,
        likes: likes,
        views: views,
      );
}

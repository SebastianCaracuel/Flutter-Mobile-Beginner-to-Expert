//Todo: Provider

//Importaciones
import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/infrastructure/models/local_video_model.dart';
import 'package:toktik_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //todo: Reposity, datasource

  //?Bandera booleana -
  bool initialLoading = true;

  //Creamos una lista con todos los videos
  List<VideoPost> videos = [];

  //Cargamos los videos
  Future<void> loadNextPage() async {
    //!simulación de http async

    //Esperamos dos segundos
    //await Future.delayed(const Duration(seconds: 2));

    //Luego carga los videos
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    notifyListeners();
    initialLoading = false;
    //Todo: cargar los videos
    //
  }
}

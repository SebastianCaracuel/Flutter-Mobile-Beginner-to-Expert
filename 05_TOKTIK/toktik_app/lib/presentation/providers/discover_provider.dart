import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/infrastructure/models/local_video_model.dart';
import 'package:toktik_app/shared/data/local_video_post.dart';

//Creamos la clase para utilizar nuestro Gestor de Estados Provider

class DiscoverProvider extends ChangeNotifier {
  //todo: Repositories and Datasource - Clean Arquitecture

  //Creamos una bandera bool - es para carga antes de que aprezcan los videos.
  bool initialLoading = true;

  //Creamos nuestra lista donde estarán los videos
  List<VideoPost> videos = [];

  //Metodo para cargar los videos
  Future<void> loadNextPage() async {
    //todo:cargar videos

    //Simulación de carga async - Metodo para preloading de dos segundos antes de cargar los videos
    await Future.delayed(const Duration(seconds: 2));

    //Cargamos los videos - con el List
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    //Añadimos los nuevos videos
    videos.addAll(newVideos);

    //
    initialLoading = false;

    //Llamamosa los videos
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';

//Creamos la clase para utilizar nuestro Gestor de Estados Provider

class DiscoverProvider extends ChangeNotifier {
  //Creamos una bandera bool - es para carga antes de que aprezcan los videos.
  bool initialLoading = true;

  //Creamos nuestra lista donde estarán los videos
  List<VideoPost> videos = [];

  //Metodo para cargar los videos
  Future<void> loadNextPage() async {
    //todo:cargar videos

    //Llamamosa los videos
    notifyListeners();
  }
}

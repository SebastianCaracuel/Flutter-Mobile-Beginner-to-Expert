//Todo: Provider

//Importaciones
import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  //?Bandera booleana -
  bool initialLoading = true;

  //Creamos una lista con todos los videos
  List<VideoPost> videos = [];

  //Cargamos los videos
  Future<void> loadNextPage() async {
    //Todo: cargar los videos
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';

//Es un reproductor de videos Scrolleable. Esto quiere decir que cremaos un widget que se puede realizar scroll

class VideoScollView extends StatelessWidget {
  //Recibimos nuestra lista de videos
  final List<VideoPost> videos;

  //Parametros de la clase
  const VideoScollView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    //?PageView - toma todo el espacio disponible o el espacio que se este asignando
    return PageView(
      //Creamos un Rebote a nuestro scroll
      physics: const BouncingScrollPhysics(),
      //Colocamos nuestro scroll en vertical por lo que cambiamos su dirección
      scrollDirection: Axis.vertical,

      //VideoPlayer + Buttons + Gradiant ( all things about scroll or page)
      children: [],
    );
  }
}

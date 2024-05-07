//Creamos el Reproductor de videos Scrolleable
//Que se puede hacer Scroll

import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';

class VideoScrollView extends StatelessWidget {
  //Recibimos la lista de videos
  final List<VideoPost> videos;

  const VideoScrollView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    //?Es un Widgets que nos permite hacer scroll a pantalla completa.
    return PageView.builder(
      //Creamos un Rebote
      physics: const BouncingScrollPhysics(),
      //Queremos que nuestro Scroll sea vertical
      scrollDirection: Axis.vertical,
      //
      itemCount: videos.length,
      //
      itemBuilder: (context, index) {
        //Cargamos nuestro VideoPost
        final VideoPost videoPost = videos[index];

        //Retornamos un Stack Widget porque tendremos Widgets uno encima de otros
        return const Stack(
          children: [
            //VideoPlayer + gradiente

            //Botones
          ],
        );
      },
    );
  }
}

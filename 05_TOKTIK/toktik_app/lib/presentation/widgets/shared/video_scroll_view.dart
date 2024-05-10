import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toktik_app/domain/entities/video_post.dart';
import 'package:toktik_app/presentation/widgets/shared/video_player/video_buttons.dart';

//Es un reproductor de videos Scrolleable. Esto quiere decir que cremaos un widget que se puede realizar scroll

class VideoScollView extends StatelessWidget {
  //Recibimos nuestra lista de videos
  final List<VideoPost> videos;

  //contructor de la clase
  const VideoScollView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    //?PageView - toma todo el espacio disponible o el espacio que se este asignando
    return PageView.builder(
      //Creamos un Rebote a nuestro scroll
      physics: const BouncingScrollPhysics(),
      //Colocamos nuestro scroll en vertical por lo que cambiamos su dirección
      scrollDirection: Axis.vertical,

      //Especificamos cuantos elementos tengo
      itemCount: videos.length,

      //VideoPlayer + Buttons + Gradiant ( all things about scroll or page)
      itemBuilder: (context, index) {
        //Referencia al videoPost
        final VideoPost videoPost = videos[index];

        //!Construcción de la pantalla Scroll View
        //Utilizamos un Stack que nos permite colocar Widgets uno sobre otros
        return Stack(
          children: [
            //?Gradiant

            //?VideoPlayer

            //?Button
            //Envolvemos nuestro widget en un nuevo widget
            Positioned(
                //Posición abajo
                bottom: 40,
                //Derecha
                right: 20,
                child: VideoButtons(video: videoPost)),
          ],
        );
      },
    );
  }
}

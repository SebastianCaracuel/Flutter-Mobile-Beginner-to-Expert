import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//FullScreenPlayer donde dejaremos nuestros videos que será de un uso general
class FullScreenPlayer extends StatefulWidget {
  //Propiedades de la clase
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  //Creamos un controlador
  late VideoPlayerController controller;

  //Inicio de nuestro ci
  @override
  void initState() {
    super.initState(); //siempre tiene que ir al Inicio

    //Llamamos a nuestro video
    controller = VideoPlayerController.asset(widget.videoUrl)
      //Le quitamos el volumen al video
      ..setVolume(0)
      //dejamos el video en loop
      ..setLooping(true)
      //y le damos play.
      ..play();
  }

  //Cerramos
  @override
  void dispose() {
    controller.dispose();
    //Este siempre debe ir al final.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Accedemos a los parametros de statefulwidget widget.caption

    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        return const Center(
            child:
                CircularProgressIndicator(strokeWidth: 2, color: Colors.red));
      },
    );
  }
}

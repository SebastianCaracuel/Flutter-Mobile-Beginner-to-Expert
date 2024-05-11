import 'package:flutter/material.dart';
import 'package:toktik_app/presentation/widgets/videos/gradiant_backgraound.dart';
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
        //Este indicador circular solo funcionara si estamosen el paso del reproductor - Condición
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child:
                  CircularProgressIndicator(strokeWidth: 2, color: Colors.red));
        }

        //Reproducimos nuestros videos
        return GestureDetector(
          //Detector de gestos -
          onTap: () {
            //Condición - si el video se esta reproduciendo se puede pausar y si no se puede dar play

            if (controller.value.isPlaying) {
              controller.pause();
              return;
            } //Si esta en pausa le damos play
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                //?VideoPlayer - Reproductor del Video
                VideoPlayer(controller),

                //?Gradiante
                VideoBackground(
                  //Condionamos los stops
                  stops: const [0.8, 1.0],
                ),

                //?Texto - Nombre etc.
                Positioned(
                    //Posición de nuestra info
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(caption: widget.caption))
              ],
            ),
          ),
        );
      },
    );
  }
}

//Creamos un WIdget para recibir nuestro texto o titulo del video
class _VideoCaption extends StatelessWidget {
  //Propiedades
  final String caption;

  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    //Creamos una propiedad para ver el tamaño de la pantalla
    final size = MediaQuery.of(context).size;

    //Creamos un formato de titulo de texto y lo llamamos para nuestra propiedad.
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}

//Importaciones
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//Creamos nuestra pantalla de videos

class FullScreenPlayer extends StatefulWidget {
  //Colocamos las variables que vamos a utilizar
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  //?Para acceder a las propiedades o variables debemos colocar - widget.(nombre)

  //Creamos un controlador para los video
  late VideoPlayerController controller;

  //StatefulWidget si tiene Ciclo de vida -
  @override
  void initState() {
    //Se inicializa primero
    super.initState();

    //Definimos nuestro controlador.
    controller = VideoPlayerController.asset(widget.videoUrl)
      //Le quitamos el volumen al video - en caso de que este tenga
      ..setVolume(0)
      //Colocamos que el video se repita en Loop
      ..setLooping(true)
      //Y que se reproduzca inmediatamente
      ..play();
  }

  //Limpiamos el controlador
  @override
  void dispose() {
    //Limpiamos el controlador - para evitar que el video se siga reproduciendo a pesar de que ya no lo estamos viendo
    //Para evitar una Fuga de memoria.
    controller.dispose();
    //Este siempre va al Final
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        //Condición del indicador de progreso - estamos en paso de inicialización de el reproductor
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        }
        return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller));
      },
    );
  }
}

//Importaciones
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

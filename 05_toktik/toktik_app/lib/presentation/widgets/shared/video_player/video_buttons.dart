//Creamos los botones
import 'package:flutter/material.dart';
import 'package:toktik_app/config/helpers/human_formats.dart';
import 'package:toktik_app/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  //Llamos a nuestro videoPost
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    //Creamos una columna debido a que estaran ordenados de forma vertical
    return Column(
      children: [
        //Botones Personalizados
        _CustomIconButton(
            value: video.likes,
            iconData: Icons.favorite_rounded,
            iconColor: Colors.red),
        _CustomIconButton(
            value: video.views, iconData: Icons.remove_red_eye_outlined)
      ],
    );
  }
}

//Creamos un Widget Personalizado del Buton
class _CustomIconButton extends StatelessWidget {
  //Creamos unas variables que son los texto o archivos que voy a mostrar
  final int value;
  final IconData iconData;
  //El color va a ser opcional
  final Color? color;

  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}

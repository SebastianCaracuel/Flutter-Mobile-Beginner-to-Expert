import 'package:flutter/material.dart';
import 'package:toktik_app/domain/entities/video_post.dart';

//Creamos nuestros botones
class VideoButtons extends StatelessWidget {
  //Llamamos a nuestro VideoPost
  final VideoPost video;

  //Parametros de la clase
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    //Creamos una columna donde tener los botones
    return Column(
      children: [
        _CustomIconButton(
            value: video.likes,
            iconData: Icons.favorite,
            iconColor: Colors.red),
        _CustomIconButton(
            value: video.views, iconData: Icons.remove_red_eye_outlined),
      ],
    );
  }
}

//Creamos un WIdget Personalizado

class _CustomIconButton extends StatelessWidget {
  //Definimos nuestras propiedades para nuestro Botón(Botones) personalizado
  //cantidad de likes o views
  final int value;
  //El icono que quiero mostrar
  final IconData iconData;
  //EL color que quiero mostrar
  final Color? color;

  //constructor con los parametros
  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      //Colocamos que el color sea opcional y si no lo colocamos que el color por defecto sea blanco.
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Nuestros Botones
        IconButton(

            //todo:
            onPressed: () {},
            //ICONO
            icon: Icon(
              iconData,
              //Color del Icono
              color: color,
              //Le colocamos también el tamaño al icono
              size: 25,
            )),

        //Mostramos el valor
        Text('$value'),
      ],
    );
  }
}

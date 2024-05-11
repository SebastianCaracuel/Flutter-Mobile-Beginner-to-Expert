import 'package:flutter/material.dart';

//Creamos el gradiante
class VideoBackground extends StatelessWidget {
  //Propiedades de la clase

  //Creamos una lista de "colores"
  final List<Color> colors;

  //Creamos los stops - donde queremos que nuestro gradiante se detenga
  final List<double> stops;

  //Constructor
  const VideoBackground(
      {super.key,
      this.colors = const [
        //SI no recibe los colores tendrá uno por defecto
        Colors.transparent,
        Colors.black87
      ],
      //Lost stops debe ser la misma cantidad de colores
      this.stops = const [0.0, 1.0]})
      //Creamos un assert para que otros programadores sepan que tenemos una lista de colores
      : assert(colors.length == stops.length,
            'Stops and colors must be same length');

  @override
  Widget build(BuildContext context) {
    //El fill dice que tome todo el espacio posible
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            //Definimos la lista de colores que usara el gradiante
            colors: colors,

            //Donde queremos que se detenga nuestro radiante
            stops: stops,

            //?Donde inicia o empieza el gradiente
            begin: Alignment.topCenter,
            //?Donde quiero que termine mi gradiente
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

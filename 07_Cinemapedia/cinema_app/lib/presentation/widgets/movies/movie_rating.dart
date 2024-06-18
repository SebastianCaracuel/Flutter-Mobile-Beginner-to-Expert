//Importaciones Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/config/helpers/human_formats.dart';

//Creamos un Widget para el rating aparte.
class MovieRating extends StatelessWidget {
  //Propiedades de la clase

  //?
  final double voteAverage;

  //Constructor
  const MovieRating({super.key, required this.voteAverage});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //?Añadimos un estilo al texto
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
          const SizedBox(width: 3),
          Text(HumanFormats.number(voteAverage, 1),
              style: textStyles.bodyMedium
                  ?.copyWith(color: Colors.yellow.shade800)),
        ],
      ),
    );
  }
}

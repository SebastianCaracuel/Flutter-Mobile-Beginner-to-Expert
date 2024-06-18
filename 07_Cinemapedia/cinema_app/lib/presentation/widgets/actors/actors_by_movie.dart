//Importaciones FLutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/providers/providers.dart';

// Definición de un widget que consume un proveedor de estado utilizando Riverpod
class ActorsByMovie extends ConsumerWidget {
  // Propiedades de la clase
  final String movieId; // ID de la película

  // Constructor
  const ActorsByMovie(
      {super.key,
      required this.movieId}); // Constructor con la propiedad requerida movieId

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Propiedades del objeto

    // Obtiene los actores por película desde el proveedor
    final actorByMovie = ref.watch(actorsByMovieProvider);

    // Si no hay actores para la película especificada, muestra un indicador de carga
    if (actorByMovie[movieId] == null) {
      return Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 50),
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    // Obtiene la lista de actores para la película especificada
    final actors = actorByMovie[movieId]!;

    // Construye un ListView horizontal para mostrar los actores
    return SizedBox(
      height: 300, // Altura del contenedor
      child: ListView.builder(
        scrollDirection:
            Axis.horizontal, // Dirección de desplazamiento horizontal
        itemCount: actors.length, // Número de elementos en la lista
        itemBuilder: (context, index) {
          final actor = actors[index]; // Actor en la posición actual

          return Container(
            padding: const EdgeInsets.all(8.0), // Padding del contenedor
            width: 135, // Ancho del contenedor
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alineación de la columna
              children: [
                // Foto del actor
                FadeInRight(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(20), // Bordes redondeados
                    child: FadeInImage(
                      height: 180, // Altura de la imagen
                      width: 135, // Ancho de la imagen
                      placeholder: const AssetImage(
                          'assets/loaders/bottle-loader.gif'), // Imagen de carga
                      image:
                          NetworkImage(actor.profilePath), // Imagen del actor
                    ),
                  ),
                ),
                const SizedBox(height: 5), // Espacio entre la imagen y el texto

                // Nombre del actor
                Text(actor.name, maxLines: 2),
                // Personaje interpretado por el actor
                Text(
                  actor.character ??
                      '', // Nombre del personaje o cadena vacía si es nulo
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow
                        .ellipsis, // Texto truncado con puntos suspensivos
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

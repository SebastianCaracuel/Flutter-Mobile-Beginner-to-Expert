//Importaciones flutter

import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:animate_do/animate_do.dart';

//Creamos una clase
class SearchMovieDelegate extends SearchDelegate<Movie?> {
  // Esta propiedad sobreescribe el texto del marcador de posición (placeholder)
  // del campo de búsqueda. Cuando el usuario ve el campo de búsqueda vacío,
  // verá "search movie" en lugar del texto por defecto (search). Esto ayuda a indicar
  // claramente al usuario que puede buscar películas.
  @override
  String get searchFieldLabel => "search movie";

  // Este método construye las acciones para el AppBar en la pantalla de búsqueda.
  // Normalmente, incluiría widgets como un botón para limpiar la búsqueda.
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      // El widget FadeIn anima su hijo (child) cuando su propiedad `animate` es verdadera.
      FadeIn(
        // La animación solo se activa si la consulta (query) no está vacía.
        animate: query.isNotEmpty,
        // Duración de la animación (200 milisegundos).
        duration: const Duration(milliseconds: 200),
        // El hijo del FadeIn es un IconButton.
        child: IconButton(
          // Cuando se presiona el botón, la consulta se borra (se establece en una cadena vacía).
          onPressed: () => query = '',
          // El icono mostrado en el botón es un ícono de limpiar (clear).
          icon: const Icon(Icons.clear),
        ),
      ),
    ];
  }

  // Este método construye el widget que aparece al principio del AppBar,
  // como un botón de retroceso para cerrar la búsqueda.
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      // Utilizamos un Onpressed para ir "hacia atras" la pagina principal
      // En este caso, se llama a `close` para cerrar la búsqueda y se pasa `null` como resultado.
      onPressed: () => close(context, null),
      // El icono mostrado en el botón es una flecha hacia atrás.
      icon: const Icon(Icons.arrow_back),
    );
  }

  // Este método construye los resultados de la búsqueda basados en la consulta del usuario.
  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  // Este método construye las sugerencias que se muestran mientras el usuario escribe.
  // Puede mostrar una lista de sugerencias o resultados previos.
  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('buildSuggestions');
  }
}

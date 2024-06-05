//Importaciones flutter
import 'package:flutter/material.dart';
//Importaciones nuestras

//Creamos una clase

class SearchMovieDelegate extends SearchDelegate {
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
    return [const Text('buildActions')];
  }

  // Este método construye el widget que aparece al principio del AppBar,
  // como un botón de retroceso para cerrar la búsqueda.
  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('buildLeading');
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

// Importaciones de Flutter y paquetes relacionados
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Importa flutter_riverpod, que es una biblioteca para la gestión del estado en Flutter
// Importaciones de nuestros propios módulos
import 'package:cinema_app/domain/entities/entities.dart'; // Importa la entidad Actors de nuestro dominio de la aplicación
import 'package:cinema_app/presentation/providers/actors/actors_repository_provider.dart';

//? Proveedor de estado para la información del actor
final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier,
        Map<String, List<Actor>>>(
    // `ref` es una referencia proporcionada por Riverpod que permite acceder a otros proveedores
    //y objetos dentro del árbol de widgets.
    (ref) {
  final actorsRepository =
      // Utiliza `ref.watch` para observar el proveedor de repositorio de películas y obtener su instancia actual.
      ref.watch(actorsRepositoryProvider);

  // Retorna una instancia de MovieMapNotifier, pasando el método getMovieID del repositorio.
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

// Define un alias para un callback que recibe un ID de película y devuelve una Future<Actor>
typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

// Creamos esta clase para tener una referencia que nos permita tener una clase que guarde en caché los actores.
class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  // Propiedades
  final GetActorsCallback
      getActors; // Definimos una propiedad para el callback que obtendrá el actor

  // Constructor
  // Recibe el callback getMovie como parámetro requerido y inicializa el estado con un mapa vacío
  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  // Método para cargar un actor
  Future<void> loadActors(String movieId) async {
    // Verifica si la película ya está en el estado (caché) para evitar volver a cargarla
    if (state[movieId] != null) return;

    // Si la película no está en caché, llama al callback getActors para obtenerla
    final List<Actor> actors = await getActors(movieId);

    //Actualiza el estado añadiendo el nuevo actor al mapa
    state = {...state, movieId: actors};
  }
}

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones nuestras
import 'package:cinema_app/domain/entities/entities.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';

// Definición de un proveedor para obtener películas similares basado en el ID de una película
final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  // Obtiene una instancia del repositorio de películas desde el proveedor
  final movieRepository = ref.watch(movieRepositoryProvider);
  // Llama al método para obtener películas similares y retorna el resultado
  return movieRepository.getSimilarMovies(movieId);
});

// Definición de un widget que consume el proveedor de películas similares
class SimilarMovies extends ConsumerWidget {
  final int movieId; // ID de la película

  // Constructor
  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observa el estado del proveedor de películas similares
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    // Construye la interfaz basada en el estado del proveedor
    return similarMoviesFuture.when(
      // Si los datos están disponibles, muestra las recomendaciones
      data: (movies) => _Recomendations(movies: movies),
      // Si hay un error, muestra un mensaje de error
      error: (_, __) =>
          const Center(child: Text('Could not load similar movies')),
      // Mientras los datos se cargan, muestra un indicador de progreso
      loading: () =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

// Widget para mostrar las recomendaciones de películas
class _Recomendations extends StatelessWidget {
  final List<Movie> movies; // Lista de películas recomendadas

  // Constructor
  const _Recomendations({required this.movies});

  @override
  Widget build(BuildContext context) {
    // Si la lista de películas está vacía, retorna un SizedBox vacío
    if (movies.isEmpty) return const SizedBox();

    // Si hay películas, muestra una lista horizontal de películas
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 50), // Margen inferior
      child: MovieHorizontalListview(
        title: 'Other Movies', // Título de la lista
        subtitle: 'Recommendations', //REcomendaciones
        movies: movies, // Lista de películas a mostrar
      ),
    );
  }
}

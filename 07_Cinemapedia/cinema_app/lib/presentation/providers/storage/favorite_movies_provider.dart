// Importaciones Flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importaciones Nuestras
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/infrastructure/repositories/isar_repository_impl.dart';

// Proveedor de StateNotifier para gestionar el estado de las películas favoritas
final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  // Obtiene una referencia al provider del repositorio local
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  // Retorna una instancia de StorageMoviesNotifier inicializada con el repositorio
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

// Clase que extiende StateNotifier para gestionar el estado de las películas almacenadas
class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  // Página actual de carga de películas
  int page = 0;

  // Repositorio de almacenamiento local para obtener las películas
  final LocalStorageRepositoryImpl localStorageRepository;

  // Constructor que inicializa el repositorio y el estado inicial (vacío)
  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  // Método asincrónico para cargar la siguiente página de películas
  Future<void> loadNextPage() async {
    // Carga las películas desde el repositorio local, usando el offset calculado según la página actual
    final movies = await localStorageRepository.loadMovies(offset: page * 10);

    // Incrementa el número de página para la próxima carga
    page++;

    // Mapa temporal para almacenar las películas cargadas
    final tempMoviesMap = <int, Movie>{};

    // Itera sobre las películas cargadas y las agrega al mapa temporal usando su ID como clave
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    // Actualiza el estado del StateNotifier con un nuevo mapa que contiene las películas cargadas
    state = {...state, ...tempMoviesMap};
  }
}

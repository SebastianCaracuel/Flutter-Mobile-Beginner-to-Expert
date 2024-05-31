//Improtaciones flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importaciones propias del proyecto
import 'movies_providers.dart';

// Definición del proveedor 'initialLoadingProvider'
final initialLoadingProvider = Provider((ref) {
  // 1. Obtención de referencias a los proveedores de películas
  //    - nowPlayingMoviesProvider: Proporciona la lista de películas en cartelera
  //    - popularMoviesProvider: Proporciona la lista de películas populares
  //    - rankingMoviesProvider: Proporciona la lista de películas en ranking
  //    - soonrMoviesProvider: Proporciona la lista de películas próximas a estrenarse
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(rankingMoviesProvider).isEmpty;
  final step4 = ref.watch(soonrMoviesProvider).isEmpty;

  // 2. Lógica para determinar si mostrar el indicador de carga inicial
  //    - Si alguna de las listas de películas está vacía, se muestra el indicador.
  //    - Si todas las listas están cargadas, se oculta el indicador.
  if (step1 || step2 || step3 || step4) return true;

  return false; //Terminamos de cargar
});

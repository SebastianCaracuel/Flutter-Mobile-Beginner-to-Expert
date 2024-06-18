//Importaciones flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones Nuestras
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
//

// Definición de un widget con estado que utiliza el ConsumerStatefulWidget de Riverpod
class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key}); // Constructor

  @override
  PopularViewState createState() =>
      PopularViewState(); // Crea el estado del widget
}

// Definición de la clase del estado del widget
class PopularViewState extends ConsumerState<PopularView>
    with AutomaticKeepAliveClientMixin {
  // Método build para construir la interfaz del widget
  @override
  Widget build(BuildContext context) {
    super.build(context); // Llama al método build de la clase padre

    // Obtiene la lista de películas populares desde el proveedor
    final popularMovies = ref.watch(popularMoviesProvider);

    // Si la lista de películas populares está vacía, muestra un indicador de carga
    if (popularMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }

    // Si hay películas populares, muestra un Scaffold con un MoviesMasonry
    return Scaffold(
      body: MoviesMasonry(
        // Función para cargar la siguiente página de películas populares
        laodNextPage: () =>
            ref.read(popularMoviesProvider.notifier).laodNextPage(),
        movies: popularMovies, // Lista de películas populares a mostrar
      ),
    );
  }

  // Método que indica si el estado del widget debe mantenerse vivo
  @override
  bool get wantKeepAlive => true; // Retorna true para mantener el estado
}

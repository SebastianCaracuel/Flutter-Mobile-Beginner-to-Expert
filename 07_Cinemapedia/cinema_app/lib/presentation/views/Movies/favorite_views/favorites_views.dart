//Importaciones flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones Nuestras
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';

//Clase para la vista de las películas Favoritas - Cambiamos de un Stateless a un ConsumerStatefulWidget
class FavoritesViews extends ConsumerStatefulWidget {
  //Propiedades de la vista

  //Constructor
  const FavoritesViews({super.key});

  @override
  FavoritesViewsState createState() => FavoritesViewsState();
}

//ConsumerStateFulWidget
class FavoritesViewsState extends ConsumerState<FavoritesViews> {
  //?  Variables para manejar el estado de la carga de películas
  bool isLastPage = false; // Indica si hemos llegado a la última página.
  bool isLoading = false; // Indica si estamos actualmente cargando películas.

  //! Método que se llama cuando se inicializa el estado del widget
  @override
  void initState() {
    super.initState();
    // Llama al método para cargar la siguiente página de películas
    loadNextPage();
  }

  // !Método para cargar la siguiente página de películas
  void loadNextPage() async {
    // Si ya estamos cargando o si hemos llegado a la última página, no hacemos nada
    if (isLoading || isLastPage) return;

    // Indicamos que estamos cargando
    isLoading = true;

    // Llamamos al proveedor para cargar la siguiente página de películas favoritas
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();

    // Indicamos que hemos terminado de cargar
    isLoading = false;

    // Si no se obtuvieron más películas, indicamos que hemos llegado a la última página
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto | MoviesMasonry

    //Le colocamos una variable que podamos utilizar a nuestro provider de películas Favoritas
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    //Retornamos el Widget de diseño MoviesMasonry y le colocamos las películas Favoritas.
    return Scaffold(
        body: MoviesMasonry(
            //le tiramos las siguientes películas
            laodNextPage: loadNextPage,
            //Llamamos a las películas Favoritas
            movies: favoriteMovies));
  }
}

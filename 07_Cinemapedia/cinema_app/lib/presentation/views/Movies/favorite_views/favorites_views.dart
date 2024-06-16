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
  //Inicia en
  @override
  void initState() {
    super.initState();

    //Llamamos a nuestra referencia del Provider de las películas Favoritas
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto | MoviesMasonry

    //Le colocamos una variable que podamos utilizar a nuestro provider de películas Favoritas
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    //Retornamos el Widget de diseño MoviesMasonry y le colocamos las películas Favoritas.
    return Scaffold(body: MoviesMasonry(movies: favoriteMovies));
  }
}

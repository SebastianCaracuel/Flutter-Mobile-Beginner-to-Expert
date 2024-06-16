//Importaciones flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones Nuestras
import 'package:cinema_app/presentation/providers/providers.dart';

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
    //Propiedades del Objeto

    //Le colocamos una variable que podamos utilizar a nuestro provider de películas Favoritas
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    return Scaffold(
        body: ListView.builder(
      //Llamamos al largo de nuestras películas Favoritas
      itemCount: favoriteMovies.length,
      itemBuilder: (context, index) {
        //Propiedades del Builder

        //?Colocamos una variable que podamos utilizar a nuestro provider con el indice
        final movie = favoriteMovies[index];

        //Widget Padre
        return ListTile(
          title: Text(movie.title),
        );
      },
    ));
  }
}

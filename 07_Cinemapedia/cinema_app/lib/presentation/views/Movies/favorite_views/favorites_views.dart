//Importaciones flutter
import 'package:flutter/material.dart';
//Importaciones Nuestras

//Clase para la vista de las vistas de Favoritos
class FavoritesViews extends StatelessWidget {
  //Propiedades de la vista

  //Constructor
  const FavoritesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites View'),
      ),
      body: const Center(
        child: Text('Favorites View'),
      ),
    );
  }
}

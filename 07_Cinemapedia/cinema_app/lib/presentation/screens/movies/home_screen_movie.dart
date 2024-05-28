//Importaciones de Flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';

//Creamos la clases
class HomeScreen extends StatelessWidget {
  //Propiedades de la clase
  //?Nombre de la screen
  static const name = 'home_screen';

  //Constructor de la clase
  const HomeScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widgets
    return const Scaffold(
      //Extraemos nuestro widget
      body: _HomeView(),

      //Barra de navegación
      bottomNavigationBar: CustomButtomBar(),
    );
  }
}

//Widgets  - Screen Home - consumer StatefulWidget
class _HomeView extends ConsumerStatefulWidget {
  //Propiedades de la clase

  //Constructor de la clase
  const _HomeView();

//override
  @override
  _HomeViewState createState() => _HomeViewState();
}

//State - al realizar los cambios como consumer no es necesario colocarlo como propiedad si no que ya viene implementado
class _HomeViewState extends ConsumerState<_HomeView> {
  //Propiedades del State

//Creamos un initState
  @override
  void initState() {
    //El super.initState siempre va de los primeros
    super.initState();

    //Llamamos a nuestra referencia - el loadnextpage
    ref.read(nowPlayingMoviesProvider.notifier).laodNextPage();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Llamamos a nuestras referencias para poder ver las películas por pantalla
    //?Referencia para mostrar las películas
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    //?Referencia para los slideShows - Mostrar imagen de las peliculas
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);

    //Condición - //? Si el largo de las películas en cine ahora, es igual a 0 (no hay películas ) muestra un circulo de progreso
    // if (nowPlayingMovies.isEmpty) {
    //   return const Center(child: CircularProgressIndicator());
    // }

    //Widgets
    return Column(
      children: [
        //todo: Llamamos a nuestro Custom AppBar
        const CustomAppbar(),

        //todo: Llamamos a nuestra referencia de SlideShows
        MovieSlideshow(movies: moviesSlideshow),

        //todo: Llamamos a nuestra referencia de películas
        MovieHorizontalListview(
          //?Llamamos a nuestra referencia
          movies: nowPlayingMovies,
          title: 'En cines',
          subtitle: 'Lunes 20',
        ),
      ],
    );
  }
}

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

    //Utilizamos un CustomScrollView para controlar las acciones de nuestro Home
    return CustomScrollView(
      //Slivers - widgets que trabaja directamente con los CustomScrollView
      slivers: [
        // Configuración del SliverAppBar
        const SliverAppBar(
          // Se establece en true para que la barra de aplicación flote sobre el contenido mientras se desplaza hacia abajo
          floating: true,
          // Contenido flexible de la barra de aplicación
          flexibleSpace: FlexibleSpaceBar(
            // Título de la barra de aplicación, se utiliza un widget personalizado
            title: CustomAppbar(),
            // Se establece el relleno del título en cero para que ocupe todo el espacio disponible
            titlePadding: EdgeInsets.zero,
          ),
        ),

        // Utilizamos un SliverList para crear una lista desplazable de widgets
        SliverList(
          // Delegate - Esta función se utiliza para crear los widgets dentro del ListView de forma dinámica
          delegate: SliverChildBuilderDelegate(
            // Esta función se llama para construir cada elemento de la lista
            (context, index) {
              // Llamamos a nuestro hijo (child), es decir, todo lo que queremos mostrar en pantalla
              return Column(children: [
                //todo: Llamamos a nuestra referencia de SlideShows
                MovieSlideshow(movies: moviesSlideshow),

                //todo: Llamamos a nuestra referencia de películas
                MovieHorizontalListview(
                    //?Llamamos a nuestra referencia
                    movies: nowPlayingMovies,
                    title: 'In cinema',
                    subtitle: 'Monday 20',
                    //Llamamos a la función de cargar otras paginas
                    loadNextPage: () {
                      //Utilizamos nuestra referencia y le agregamos el metodo
                      ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .laodNextPage();
                    }),

                //todo: Llamamos a nuestra referencia de películas
                MovieHorizontalListview(
                    //?Llamamos a nuestra referencia
                    movies: nowPlayingMovies,
                    title: 'Comming soon',
                    subtitle: 'In this Month',
                    //Llamamos a la función de cargar otras paginas
                    loadNextPage: () {
                      //Utilizamos nuestra referencia y le agregamos el metodo
                      ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .laodNextPage();
                    }),

                //todo: Llamamos a nuestra referencia de películas
                MovieHorizontalListview(
                    //?Llamamos a nuestra referencia
                    movies: nowPlayingMovies,
                    title: 'Popular',
                    subtitle: 'In this Month',
                    //Llamamos a la función de cargar otras paginas
                    loadNextPage: () {
                      //Utilizamos nuestra referencia y le agregamos el metodo
                      ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .laodNextPage();
                    }),

                //todo: Llamamos a nuestra referencia de películas
                MovieHorizontalListview(
                    //?Llamamos a nuestra referencia
                    movies: nowPlayingMovies,
                    title: 'Top rated',
                    subtitle: 'In this year',
                    //Llamamos a la función de cargar otras paginas
                    loadNextPage: () {
                      //Utilizamos nuestra referencia y le agregamos el metodo
                      ref
                          .read(nowPlayingMoviesProvider.notifier)
                          .laodNextPage();
                    }),

                //Espacio
                const SizedBox(height: 15),
              ]);
            },
            //Este Widgets nos sirve para ver cuantas veces queremos ver el child que estamos retornando
            //En este caso, queremos verlo una sola vez, pero si agregamos más se repetirá nuestro child
            childCount: 1,
          ),
        ),
      ],
    );
  }
}

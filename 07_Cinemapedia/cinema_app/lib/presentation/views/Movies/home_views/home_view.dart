//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'package:cinema_app/presentation/providers/providers.dart';
import '../../../widgets/widgets.dart';

//

//Widgets  - Screen Home - consumer StatefulWidget
class HomeView extends ConsumerStatefulWidget {
  //Propiedades de la clase

  //Constructor de la clase
  const HomeView({super.key});

//override
  @override
  HomeViewState createState() => HomeViewState();
}

//State - al realizar los cambios como consumer no es necesario colocarlo como propiedad si no que ya viene implementado
class HomeViewState extends ConsumerState<HomeView> {
  //Propiedades del State

//Creamos un initState
  @override
  void initState() {
    //El super.initState siempre va de los primeros
    super.initState();

    //Llamamos a nuestra referencia - el loadnextpage
    ref.read(nowPlayingMoviesProvider.notifier).laodNextPage();

    //?Referencia para mostrar las películas Populares
    ref.read(popularMoviesProvider.notifier).laodNextPage();

    //?Referencia  para mostrar las películas en ranking
    ref.read(rankingMoviesProvider.notifier).laodNextPage();

    //?Referencia para mostrar las películas en camino
    ref.read(soonrMoviesProvider.notifier).laodNextPage();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //?Obtiene el estado del 'initialLoadingProvider'
    final initialLoading = ref.watch(initialLoadingProvider);

    //?Muestra un cargador a pantalla completa mientras se cargan los datos
    if (initialLoading) {
      return const FullScreenLoader();
    }

    //Llamamos a nuestras referencias para poder ver las películas por pantalla
    //?Referencia para mostrar las películas
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    //?Referencia para mostrar las películas en Ranking
    final rankingMovie = ref.watch(rankingMoviesProvider);

    //?Referencia para mostrar las películas en camino
    final csoonMovie = ref.watch(soonrMoviesProvider);

    //?Referencia para los slideShows - Mostrar imagen de las peliculas
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);

    //Utilizamos un CustomScrollView para controlar las acciones de nuestro Home
    return Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
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

                  //todo: Llamamos a nuestra referencia de películas - cartelera
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

                  //todo: Llamamos a nuestra referencia de películas - En coming soon
                  MovieHorizontalListview(
                      //?Llamamos a nuestra referencia
                      movies: csoonMovie,
                      title: 'Comming soon',
                      subtitle: 'In this Month',
                      //Llamamos a la función de cargar otras paginas
                      loadNextPage: () {
                        //Utilizamos nuestra referencia y le agregamos el metodo
                        ref.read(soonrMoviesProvider.notifier).laodNextPage();
                      }),

                  //todo: Llamamos a nuestra referencia de películas - ranking
                  MovieHorizontalListview(
                      //?Llamamos a nuestra referencia
                      movies: rankingMovie,
                      title: 'Top rated',
                      subtitle: 'In this year',
                      //Llamamos a la función de cargar otras paginas
                      loadNextPage: () {
                        //Utilizamos nuestra referencia y le agregamos el metodo
                        ref.read(rankingMoviesProvider.notifier).laodNextPage();
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
      ),
    );
  }
}

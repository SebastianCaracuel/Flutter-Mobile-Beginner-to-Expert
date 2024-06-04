//Importaciones Flutter
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras

//Clase
class MovieScreen extends ConsumerStatefulWidget {
  //Propiedades

  //Nombre de la pantalla
  static const name = 'movie-screen';

  //?Definimos como propiedad el Id de una película.
  final String movieId;

  //Constructor
  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

//State
class MovieScreenState extends ConsumerState<MovieScreen> {
  //State propiedades

// Se llama al initsate cuando el estado se inicializa
  @override
  void initState() {
    super.initState();

    // Usamos `ref` para leer el proveedor `movieInfoProvider` y cargar la película usando su ID
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades objeto

    // Utilizamos `ref` para observar el estado del proveedor `movieInfoProvider` y obtener la película con el ID especificado
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    // Si la película no está cargada (es nula), mostramos un indicador de carga
    if (movie == null) {
      return const Scaffold(
          body: Scaffold(
              body: Center(child: CircularProgressIndicator(strokeWidth: 4))));
    }

    //Widget padre
    return Scaffold(
      //
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        //
        slivers: [_CustomSliverAppbar(movie: movie)],
      ),
    );
  }
}

//
class _CustomSliverAppbar extends StatelessWidget {
  //Propiedades

  //Creamos una variable que llame a nuestra película
  final Movie movie;

  //Constructor
  const _CustomSliverAppbar({required this.movie});

  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //?Creamos una variable que nos trae las dimensiones del dispositivo fisicamente
    final size = MediaQuery.of(context).size;

    //Creamos un appbar Personalizado o una barra superior
    return SliverAppBar(
      //Le agregamos un color a nuestro fondo
      backgroundColor: Colors.black,
      //Utilizamos la variable de las dimensiones porque quiero el 70 porciento de la pantalla
      expandedHeight: size.height * 0.7,
      //Utilizamos foreground para los objetos que esten dentro de nuestro appbar personalizado, que se coloque en blanco
      foregroundColor: Colors.white,
      //Este es el espacio flexible de nuestro custom appbar
      flexibleSpace: FlexibleSpaceBar(
        //Ahora queremos tener Objetos dentro de nuestro Appbar
        background: Stack(
          //Para esto utilizamos un Stack - para colocar Widgets encima de otros
          children: [
            //Utilizamos un sizebox expandido para que pueda verse completa nuestra imagen
            SizedBox.expand(
                //Utilizamos image.network para llamar a la imagen de nuestra película
                child: Image.network(
              //Llamamos a las variables para mostrar la imagen
              movie.posterPath,
              //Colocamos un fit.cover para que la imagen se expanda y se vea completo
              fit: BoxFit.cover,
            )),

            //Creamos un gradiante para poder ver el cuerpo de la imagen y los objetos en su interior
            const SizedBox.expand(
                //Utilizamos una decoración
                child: DecoratedBox(
              //un Boxdecoration
              decoration: BoxDecoration(
                //Colocamos un gradiente
                gradient: LinearGradient(
                  //Donde comienza el gradiente
                  begin: Alignment.topCenter,
                  //Donde termina el gradiente
                  end: Alignment.bottomCenter,
                  //COnfiguramos los stops
                  stops: [0.7, 1.0],
                  //Utilizamos dos colores siempre en nuestro gradiente
                  colors: [
                    //un color claro o transparente
                    Colors.transparent,
                    //Y el color que simule la sombra
                    Colors.black87
                  ],
                ),
              ),
            )),

            //Creamos un nuevo gradiente para poder ver el botón superior
            const SizedBox.expand(
                //Utilizamos una decoración
                child: DecoratedBox(
              //un Boxdecoration
              decoration: BoxDecoration(
                //Colocamos un gradiente
                gradient: LinearGradient(
                  //Donde comienza el gradiente
                  begin: Alignment.topLeft,
                  //COnfiguramos los stops
                  stops: [0.0, 0.4],
                  //Utilizamos dos colores siempre en nuestro gradiente
                  colors: [
                    //Y el color que simule la sombra
                    Colors.black87,

                    //un color claro o transparente

                    Colors.transparent,
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

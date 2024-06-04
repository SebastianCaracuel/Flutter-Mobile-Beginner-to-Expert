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
      //Creamos un Scroll personalizado
      body: CustomScrollView(
        //Quitamos la animación de bouncing
        physics: const ClampingScrollPhysics(),
        //
        slivers: [
          //todo: Llamamos a nuestro appBar personalizado que muestra la imagen de la película
          _CustomSliverAppbar(movie: movie),

          //
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _CustomMovieDetails(movie: movie),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

//Creamos un Widget para ver la descripción de la película a la que estamos llamando
class _CustomMovieDetails extends StatelessWidget {
  //Propiedades de la clase

  //?Llamamos a nuestra Película
  final Movie movie;

  //Constructor
  const _CustomMovieDetails({required this.movie});

//Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //?Creamos una variable que nos trae las dimensiones del dispositivo fisicamente
    final size = MediaQuery.of(context).size;

    //?Creamos una variable para el estilo del texto
    final textSyles = Theme.of(context).textTheme;

    // Utilizamos una columna para apilar los widgets verticalmente
    return Column(
      // Alineamos los hijos de la columna al inicio en el eje horizontal
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Colocamos un padding porque no queremos que todo quede muy pegado
        Padding(
          // Añadimos un padding uniforme de 8 píxeles a todos los lados
          padding: const EdgeInsets.all(8),

          // Utilizamos una fila para colocar los widgets horizontalmente
          child: Row(
            // Alineamos los hijos de la fila al inicio en el eje vertical
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Utilizamos ClipRRect para darle bordes redondeados a la imagen
              ClipRRect(
                  // Redondeamos las esquinas de la imagen con un radio de 20
                  borderRadius: BorderRadius.circular(20),
                  // Mostramos la imagen de la película desde una URL
                  child: Image.network(movie.posterPath,
                      // La imagen ocupará el 30% del ancho total disponible
                      width: size.width * 0.3)),

              // Añadimos un espacio horizontal entre la imagen y el siguiente widget
              const SizedBox(width: 10),

              //Titulo y descripción de la película
              SizedBox(
                  width: (size.width - 40) *
                      0.7, // Asignamos un ancho al SizedBox que es el 70% del ancho disponible menos 40 píxeles
                  child: Column(
                      //
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // Utilizamos otra columna para apilar el título y el resumen verticalmente
                      children: [
                        Text(movie.title,
                            style: textSyles
                                .titleLarge), // Mostramos el título de la película con un estilo de texto grande
                        Text(movie
                            .overview) // Mostramos el resumen de la película
                      ])),
            ],
          ),
        ),

        // Sección de géneros de la película
        Padding(
          padding: const EdgeInsets.all(
              8), // Añadimos padding de 8 píxeles alrededor de esta sección
          child: Wrap(
            // Utilizamos Wrap para que los géneros se distribuyan y se envuelvan automáticamente en la línea siguiente si no caben en una sola línea
            children: [
              // Usamos el operador de dispersión para agregar cada género como un widget Chip dentro del Wrap
              ...movie.genreIds.map((gender) => Container(
                  margin: const EdgeInsets.only(
                      right:
                          10), // Añadimos un margen derecho de 10 píxeles entre los chips
                  child: Chip(
                    label: Text(
                        gender), // Mostramos el nombre del género dentro del chip
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20)), // Redondeamos los bordes del chip
                  ))),
            ],
          ),
        ),

        // Espacio reservado para mostrar actores - ListView
        const SizedBox(
            height: 150), // Añadimos un espacio vertical fijo de 150 píxeles
      ],
    );
  }
}

//Creamos un Appbar personalizado para poder ver la información de la película, en esta caso, solo la imagen.
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

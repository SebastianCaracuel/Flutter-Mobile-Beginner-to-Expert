//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

//Importaciones nuestras
import 'package:cinema_app/domain/entities/entities.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/config/helpers/human_formats.dart';

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

    // Usamos `ref` para leer el proveedor `ActorInfoProvider` y cargar los actores usando el ID de película
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
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
        //* Titulo, OverView y Ratin
        _TitleAndOverView(movie: movie, size: size, textStyles: textSyles),

        //*todo: Generos de la película
        _Genres(movie: movie),
        //*todo :Actores de la película
        _ActorsByMovie(movieId: movie.id.toString()),
        //*todo: Película Similares
        SimilarMovies(movieId: movie.id),
        //*todo: Videos de la película( Si tiene)
        VideosFromMovie(movieId: movie.id),

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

        //Espacio para scroll
        const SizedBox(
            height: 50), // Añadimos un espacio vertical fijo de 150 píxeles
      ],
    );
  }
}

//todo: Título, OverView y Ratin
class _TitleAndOverView extends StatelessWidget {
  //Propiedades de la clase

  //? Llamamos a las películas
  final Movie movie;
  //? Le añadimos un tamaño
  final Size size;
  //? Le añadimos un estilo al texto
  final TextTheme textStyles;

  //Constructor
  const _TitleAndOverView(
      {required this.movie, required this.size, required this.textStyles});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //Widget Padre
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.posterPath,
              width: size.width * 0.3,
            ),
          ),

          const SizedBox(width: 10),

          // Descripción
          SizedBox(
            width: (size.width - 40) * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: textStyles.titleLarge),
                Text(movie.overview),
                const SizedBox(height: 10),

                //Todo: Crear el Widget
                MovieRating(voteAverage: movie.voteAverage),
                Row(
                  children: [
                    const Text('Estreno:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    Text(HumanFormats.shortDate(movie.releaseDate))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

final isFavoriteProvider =
    FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return localStorageRepository.isMovieFavorite(movieId);
});

// todo: Widget extraido de los generos
class _Genres extends StatelessWidget {
  const _Genres({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

// todo: Widget extraido de los actores
class _ActorsByMovie extends ConsumerWidget {
  //Propiedades de la clase

  //?Creamos una variable para llamar al ID de la película
  final String movieId;

  //Constructor
  const _ActorsByMovie({required this.movieId});

  //Objeto
  @override
  Widget build(BuildContext context, ref) {
    //Propiedades del objeto

    //?Llamamos al mapa con la lista de actores
    final actorsByMovie = ref.watch(actorsByMovieProvider);

    //?Creamos una condición para saber si el ID es nulo
    if (actorsByMovie[movieId] == null) {
      //
      return const Center(child: CircularProgressIndicator(strokeWidth: 4));
    }
    //Llamamos a los actores
    final actors = actorsByMovie[movieId]!;

    //Mostramos los actores por pantalla
    return SizedBox(
      height: 300,
      //Utilizamos un builder ya que es algo que será procesado mientras carga
      child: ListView.builder(
        //Colocamos un contador, que sea el largo de los actores
        itemCount: actors.length,
        //Le agregamos la dirección que sea horizontal para realizar scroll
        scrollDirection: Axis.horizontal,
        //El proceso de carga
        itemBuilder: (context, index) {
          //?Creamos una varible que tome al actor en su posición indice
          final actor = actors[index];

          //COLOCAMOS EL NUEVO WIDGET
          return Container(
            //Utilizamos un padding para que no esten tan apegados nuestros actores
            padding: const EdgeInsets.all(8.0),
            //Le asignamos un tamaño al contenedor
            width: 135,
            //Utilizamos una columna ya que vamos a usar varios widgetrs
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //? Foto del actor
                FadeInRight(
                  child: ClipRRect(
                      //Le agregamos un estilo ciruclar
                      borderRadius: BorderRadius.circular(20),
                      //Llamamos a la imagen del actor
                      child: Image.network(
                        //Utilizamos el profile path para llamar a la imagen del actor
                        actor.profilePath,
                        //Le agregamos una altura a la imagen
                        height: 180,
                        //Le asignamos una ancho a la imagen
                        width: 135,
                        //Queremos que la imagen se acomde y que se pueda ver correctamnte
                        fit: BoxFit.cover,
                      )),
                ),

                //? Nombre del actor
                const SizedBox(
                    //Le asignamos una altura para hacer una separación con la imagen
                    height: 5),
                //Le agregamos el nombre al actor
                Text(
                    //Llamamos al nombre
                    actor.name,
                    //Queremos que solo utilice dos lineas
                    maxLines: 2),
                //Le agregamos el apodo al actor
                Text(
                  //Llamamos le apodo, y si esta vacio que no muestre nada
                  actor.character ?? '',
                  //Le colocamos que solo utilice dos lienas
                  maxLines: 2,
                  //También le agregamos un estilo para que se vean aún más lindas
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      //Lo que hace el overflow es que si hay mucho texto aparecera un texto como (.....)
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//Creamos un Appbar personalizado para poder ver la información de la película, en esta caso, solo la imagen.
class _CustomSliverAppbar extends ConsumerWidget {
  //Propiedades

  //Creamos una variable que llame a nuestra película
  final Movie movie;

  //Constructor
  const _CustomSliverAppbar({required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Propiedades del Objeto

    //Llamamos a la referencia de nuestro provider para cambiar el icono de favoritos
    final isFavoriteFuture = ref.watch(isFavoriteProvider(movie.id));

    //?Creamos una variable que nos trae las dimensiones del dispositivo fisicamente
    final size = MediaQuery.of(context).size;

    //?
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    //Creamos un appbar Personalizado o una barra superior
    return SliverAppBar(
      //Le agregamos un color a nuestro fondo
      backgroundColor: Colors.black,
      //Utilizamos la variable de las dimensiones porque quiero el 70 porciento de la pantalla
      expandedHeight: size.height * 0.7,
      //Utilizamos foreground para los objetos que esten dentro de nuestro appbar personalizado, que se coloque en blanco
      foregroundColor: Colors.white,
      //Utilizamos un actions, que es para los botones de la derecha
      actions: [
        //Agregamos un icono con botón para agregar los favoritos
        IconButton(
          // Función que se ejecuta cuando se presiona el IconButton
          onPressed: () async {
            //todo:
            await ref
                .read(favoriteMoviesProvider.notifier)
                .toggleFavorite(movie);

            // Invalida el provider isFavoriteProvider para forzar su actualización
            ref.invalidate(isFavoriteProvider(movie.id));
          },
          // !Icono dinámico que cambia según el estado de isFavoriteFuture
          icon: isFavoriteFuture.when(
            // Cuando los datos están disponibles (favoritos cargados correctamente)
            data: (isFavorite) => isFavorite
                ? const Icon(Icons.favorite_rounded,
                    color: Colors.red) // ? Ícono de favorito
                : const Icon(Icons
                    .favorite_border_rounded), // ? Ícono sin marcar como favorito

            // ! Manejo de error (no debería lanzar errores, solo para manejar casos inesperados)
            error: (_, __) =>
                throw UnimplementedError(), // Manejo básico de error, puede personalizarse

            // Mientras está cargando (indicador de carga)
            loading: () => const CircularProgressIndicator(
                strokeWidth: 2), // Indicador de progreso
          ),
        ),
      ],
      //Este es el espacio flexible de nuestro custom appbar
      flexibleSpace: FlexibleSpaceBar(
        //
        titlePadding: const EdgeInsets.only(bottom: 0),
        //
        title: _CustomGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.7, 1.0],
            colors: [Colors.transparent, scaffoldBackgroundColor]),
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
              //
              loadingBuilder: (context, child, loadingProgress) {
                //
                if (loadingProgress != null) return const SizedBox();

                return FadeIn(child: child);
              },
            )),

            //Gradiente para que se vea la flecha para devolverse al Home Screen
            const _CustomGradient(
              //Donde comienza el gradiente
              begin: Alignment.topLeft,
              //COnfiguramos los stops
              stops: [0.0, 0.3],
              //Utilizamos dos colores siempre en nuestro gradiente
              colors: [
                //un color claro o transparente
                Colors.black87,
                //Y el color que simule la sombra
                Colors.transparent
              ],
            ),

            //Gradiente para que se vea el corazón de favoritos
            const _CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.3],
              colors: [
                //un color claro o transparente
                Colors.black54,
                //Y el color que simule la sombra
                Colors.transparent
              ],
            ),

            //Gradiante para el inferior de la foot
            const _CustomGradient(
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
                Colors.black54
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Creamos un Widget personalizado para el Gradiente,para que no se repita el codigo
class _CustomGradient extends StatelessWidget {
  //Propiedades de la clase

  //?
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  //Constructor
  const _CustomGradient(
      {this.begin = Alignment.centerLeft,
      this.end = Alignment.centerRight,
      required this.stops,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return //Creamos un nuevo gradiente para poder ver el botón superior
        SizedBox.expand(
            //Utilizamos una decoración
            child: DecoratedBox(
      //un Boxdecoration
      decoration: BoxDecoration(
        //Colocamos un gradiente
        gradient: LinearGradient(
            //Donde comienza el gradiente
            begin: begin,
            //Donde termina el gradiente
            end: end,
            //COnfiguramos los stops
            stops: stops,
            //Utilizamos dos colores siempre en nuestro gradiente
            colors: colors),
      ),
    ));
  }
}

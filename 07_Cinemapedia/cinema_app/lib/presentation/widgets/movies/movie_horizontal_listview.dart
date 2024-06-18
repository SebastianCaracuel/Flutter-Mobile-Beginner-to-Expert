//Importaciones flutter
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

//Importaciones nuestras
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:cinema_app/domain/entities/entities.dart';

//Creamos la clase que mostrará información de la pelicula de forma horizontal
class MovieHorizontalListview extends StatefulWidget {
  //Propiedades de la clase

  //?Necesitamos las películas que queremos mostrar - las llamamos de nuestra entidad
  final List<Movie> movies;

  //?Mencionamos que los textos serán opcionales
  final String? title;
  final String? subtitle;

  //?saber si llegue al final del SlideShow para cargar las siguientes películas.
  final VoidCallback? loadNextPage;

  //Constructor
  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  State<MovieHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

//State
class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  //Propiedades state

  //?Creamos una propiedad de controller para tener el control de la acción qu el cliente esta realizando
  final scrollController = ScrollController();

  //Iniciamos el controlador
  @override
  void initState() {
    super.initState();

    //Añadimos el listener y la propeidad
    scrollController.addListener(() {
      //todo:
      //?Llamamos al cargador de la siguiente pagina, si no tiene nada que no regrese nada
      if (widget.loadNextPage == null) return;
      //?Pero si tengo algo, si tengo un widget o un callback
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        //
        widget.loadNextPage!();
      }
    });
  }

  //Cerramos el controlador
  @override
  void dispose() {
    //Cerramos el controlador
    scrollController.dispose();
    super.dispose();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widget padre
    return SizedBox(
      //Le damos un tamaño
      height: 350,

      //Widget hijo
      child: Column(
        children: [
          //todo: datos de información de las películas
          //?Creamos una condición  - Si el titulo es diferente a nulo o el subtitlo es diferente de null
          if (widget.title != null || widget.subtitle != null)
            //?Llamamos al widget de titulo
            _Title(title: widget.title, subtitle: widget.subtitle),

          //todo:Listview para ver nuestras películas
          //Utilizamos un expanded porque necesitamos que el ListView tenga un tamaño en especifíco
          Expanded(
              //
              child: ListView.builder(
            //Colocamos nuestra variable de scrollcontroller
            controller: scrollController,
            //Vemos la dirección en el que será scrolleable
            scrollDirection: Axis.horizontal,
            //Quiero que la fisica sea igual tanto en ios como en android - Rebote de scroll
            physics: const BouncingScrollPhysics(),
            //Cuantas películas yo tengo
            itemCount: widget.movies.length,
            //Construcción
            itemBuilder: (context, index) {
              //Propiedades de la construcción

              //Regresamos un Widgets personalizado
              return FadeInRight(
                  child: _SlideHorizontal(movie: widget.movies[index]));
            },
          )),
        ],
      ),
    );
  }
}

//Creamos un nuevo Widgets para nuestra lista de películas horizontal
class _SlideHorizontal extends StatelessWidget {
  //Propiedades de la clase privada
  final Movie movie;

  //Constructor
  const _SlideHorizontal({required this.movie});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //?Creamos una propiedad para el estilo del texto de nuestra película
    final titleSyle = Theme.of(context).textTheme;

    //Widgets
    return Container(
      //Colocamos un margen lateral para que no este tan pegado
      margin: const EdgeInsets.symmetric(horizontal: 8),
      //Utilizamos una columna para tener varios Widgets
      child: Column(
        //Queremos que todos los hijos queden alineados al inicio
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //todo: Imagen de nuestras películas
          //Colocamos un SizeBox para que el contenido tenga un tamaño personalizado
          SizedBox(
            //El tamaño es de ancho es de 150 px
            width: 150,
            //! Utilizamos un clipRRect para utilizar el borde circular en la tarjeta
            child: ClipRRect(
                //BorderCircular
                borderRadius: BorderRadius.circular(20),
                //Utilizamos la detección de gestos
                child: GestureDetector(
                  //navegamos a la películas
                  onTap: () => context.push('/home/0/movie/${movie.id}'),
                  //Colocamos la imagen de la película y si no un cargado
                  child: FadeInImage(
                      //Le añadimos un tamaño de alto
                      height: 220,
                      //que la imagen se ajuste
                      fit: BoxFit.cover,
                      //Si la imagen esta en carga mostramos un loading.
                      placeholder:
                          //La imagen la utilizamos de nuestros Assets
                          const AssetImage('assets/loaders/bottle-loader.gif'),
                      //Si la imagen ya cargo le mandamos la imagen de la película
                      image: NetworkImage(movie.posterPath)),
                )),
          ),

          //Espacio
          const SizedBox(height: 5),

          //todo: titulo
          SizedBox(
              //Le asignamos un tamaño a nuestro SizeBox
              width: 150,
              child: Text(
                //Colocamos el titulo de la película
                movie.title,
                //Que las líneas de texto no se estiren
                maxLines: 2,
                //Estilo del texto
                style: titleSyle.titleSmall,
              )),

          //todo: Rating - se refiere a una medida o calificación que indica la popularidad o calidad de algo.

          MovieRating(voteAverage: movie.voteAverage)
        ],
      ),
    );
  }
}

//Creamos un Widget para el titulo o la separación entre nuestro slider superior y el horizontal
class _Title extends StatelessWidget {
  //Propiedades de la clase

  //?Recibimos los argumentos del padre
  final String? title;
  final String? subtitle;

  //Constructor
  const _Title({this.title, this.subtitle});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //?Creamos un estilo para el titulo
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    //?Creamos un estilo para el subtitulo
    final subtitleStyle = Theme.of(context).textTheme.titleMedium;

    //Widget padre
    return Container(
      //No quiero que mis bordes estan tan pegados
      padding: const EdgeInsets.only(top: 10),
      //Creamos un margen en nuestro contendor - para que nuestro texto no quede pegado a los bordes
      margin: const EdgeInsets.symmetric(horizontal: 10),

      //Utiilizamos un Row para que puedan haber dos objetos
      child: Row(
        children: [
          //El titulo
          //?Si el titulo es diferente de nulo
          if (title != null) Text(title!, style: titleStyle),

          //?Utilizamos spacer que ya ha sido utilizado antes es para que tenga un espacio entre objetos
          const Spacer(),

          //El subtitulo
          //?Si el subtitulo es diferente de nulo
          if (subtitle != null)
            FilledButton.tonal(
              //Queremos que el botón sea un poco más pequeño
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              //Función del botón
              onPressed: () {},
              //Texto
              child: Text(subtitle!, style: subtitleStyle),
            )
        ],
      ),
    );
  }
}

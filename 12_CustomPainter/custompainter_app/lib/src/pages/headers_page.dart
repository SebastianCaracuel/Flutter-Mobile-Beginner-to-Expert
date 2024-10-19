//Importaciones FLutter
import 'package:flutter/material.dart';

//Importaciones Nuestras
import 'package:custompainter_app/src/widgets/widgets.dart';

//Creamos nuestra Screen
class HeadersPage extends StatefulWidget {
  //Constructor
  const HeadersPage({super.key});

  @override
  State<HeadersPage> createState() => _HeadersPageState();
}

class _HeadersPageState extends State<HeadersPage> {
  //Creamos una propiedad para ver en que slide nos encontramos
  late final PageController pageViewControlle = PageController();

  //Creamos una bandera bool que nos permitira idenfiticar cuando llegamos al final
  bool endReached = false; // Si no se ha llegado al final

  //ciclo del vida
  @override
  void initState() {
    super.initState();
    pageViewControlle.addListener(() {
      final page = pageViewControlle.page ?? 0;

      //Creamos la condición - la condicion dice que cuando la pagina este por la mitad o apunto de pasar a la final
      //que se muestre el botón debido a que llegamos al final de las paginas
      if (!endReached && page >= (slides.length - 1.5)) {
        //Llamamos al set
        setState(() {
          endReached = true;
        });
      }
    });
  }

  //Terminamos con el ciclo de vida del Stateful con el dispose
  @override
  void dispose() {
    pageViewControlle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Utiizamos un page
      body: Stack(children: [
        PageView(
            //Llamamos al controller para saber en que pagina nos encontramos
            controller: pageViewControlle,
            //Agregamos un bouncing o rebote
            physics: const BouncingScrollPhysics(),
            children:

                //todo: Creamos nuestro slide
                slides
                    .map((slideData) => _Slide(
                          title: slideData.title,
                          widget: slideData.widget,
                        ))
                    .toList()),
      ]),
    );
  }
}

//?Creamos un widget personalizado para mostrar los diferentes Headers que hay con un Slider.
class _Slide extends StatelessWidget {
  //Propiedad
  final String title;
  final Widget? widget;

  const _Slide({
    required this.title,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    //Creamos una propiedad dentro de nuestro widget que solo será de este widget
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge; //Creamos un titulo de estilo largo

    return Stack(
      children: [
        // Muestra el CustomPainter aquí
        widget ?? const SizedBox.shrink(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Espacio
                const SizedBox(height: 20),

                //todo:Titulo del tutorial
                Text(
                  title,
                  style: titleStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//? Esta clase permite realizar slide hacia el costado para hacer navegación
class SlideInfo {
  //Propiedades dentro de nuestra nueva clase
  final String title;
  final Widget? widget;

  //Constructor de la clase con las propiedades
  SlideInfo(
    this.title,
    this.widget,
  );
}

//? Le añadimos los Distintos tipos de Headers a los Sliders.
final slides = <SlideInfo>[
  //Slide uno
  SlideInfo('Header Cuadrado', const HeaderCuadrado()),

  //todo:2
  SlideInfo('Header Cuadrado con bordes redondeados',
      const HeaderBordesRedondeados()),

  //todo:3
  SlideInfo('Header Diagonal', const HeaderDiagonal()),

  //todo:4
  SlideInfo('Header Triangulo', const HeaderTriangulo()),

  //todo:5
  SlideInfo('Header Pico', const HeaderPico()),

  //todo:6
  SlideInfo('Header Curvo', const HeaderCurvo()),

  //todo:7
  SlideInfo('Header Waves', const HeaderWave()),

  //todo:8
  SlideInfo('Header Waves Gradiant', const HeaderGradient()),
];

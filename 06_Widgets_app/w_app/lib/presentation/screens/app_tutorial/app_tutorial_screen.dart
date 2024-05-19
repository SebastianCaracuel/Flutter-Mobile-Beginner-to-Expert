import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Creamos una nueva clase //? Esta clase permite realizar slide hacia el costado para hacer navegación
class SlideInfo {
  //Propiedades dentro de nuestra nueva clase
  final String title;
  final String caption;
  final String imageUrl;

  //Constructor de la clase con las propiedades
  SlideInfo(this.title, this.caption, this.imageUrl);
}

//Creamos una propiedade para la nueva clase
final slides = <SlideInfo>[
  //Slide uno
  SlideInfo(
      'Selected your food tastes',
      'Welcome to the tutorial page, this is just an exercise. Remember to like and share the video. ',
      'assets/images/1.png'),
  //Slide dos
  SlideInfo(
      'Delivery will arrive soon',
      'You can also log into my Linkedln profile "www.linkedin/in/sebastiancaracuelgonzalez.com" or if you want to take a closer look at my learning process, you can head over to my GitHub "https://github.com/SebastianCaracuel. ',
      'assets/images/2.png'),
  //Slide tres
  SlideInfo(
      'Enojoy! your meal. Thank you for trusting us.',
      'Remember that this is continuous learning, practice makes perfect, thank you for watching my video.',
      'assets/images/3.png'),
];

//Creamos nuestra Screen
class AppTutorialScreen extends StatefulWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'tutorial_screen';

  //Constructor
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  //Creamos una propiedad para ver en que slide nos encontramos
  late final PageController pageViewControlle = PageController();

  //Creamos una bandera bool que nos permitira idenfiticar cuando llegamos al final
  bool endReached = false; // Si no se ha llegado al final

  //ciclo del vida
  @override
  void initState() {
    super.initState();
    //
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
      //Le agregamos un color de fondo
      backgroundColor: Colors.white,
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
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl))
                    .toList()),

        //todo: Colocamos el botón de salir
        Positioned(
            right: 20,
            top: 50,
            child: TextButton(
                onPressed: () => context.pop(), child: const Text('Exit!'))),

        //todo: Botón para "iniciar" con condición ya que no queremos que se muestre hasta llegar al final
        endReached
            ? Positioned(
                //Colocamos el botón al final y a la derecha
                bottom: 30,
                right: 30,
                //Agregamos una animación a nuestro botón
                child: FadeInRight(
                  //Quiero que ingrese más lento
                  delay: const Duration(seconds: 1),
                  //
                  from: 15,
                  //Llamamos  a un botón
                  child: FilledButton(
                      //La función del botón será salir de la pagina del tutorial
                      onPressed: () => context.pop(),
                      //El child es un texto
                      child: const Text('Continue')),
                ))
            : const SizedBox() //y para que funcione nuestra condición agregamos un SizeBox para que no se muestre nuestro botón
      ]),
    );
  }
}

//Creamos un widget personalizado para nuestro slide
class _Slide extends StatelessWidget {
  //Propiedad
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //Creamos una propiedad dentro de nuestro widget que solo será de este widget
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge; //Creamos un titulo de estilo largo

    final captionStyle = Theme.of(context)
        .textTheme
        .bodySmall; //Creamos un estilo para nuestra descripción
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //todo: Imagenes del Tutorial
            Image(image: AssetImage(imageUrl)),

            //Espacio
            const SizedBox(height: 20),

            //todo:Titulo del tutorial
            Text(
              title,
              style: titleStyle,
            ),
            //espacio
            const SizedBox(height: 10),

            //todo: Descripción (caption)
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}

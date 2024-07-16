//? Esta es la screen del Tutorial

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
//Importaciones nuestras

// ? Creamos una clase para el movimiento de la pantalla
class SlideInfo {
  //Propieades de la clase
  final String title;
  final String caption;
  final String imageUrl;

  //Constructor
  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  //Uno
  SlideInfo('Welcome To My Channel', '📱 Forms App for Beginners 👨🏽‍💻',
      'assets/tutorial/1.png'),
  //Dos
  SlideInfo('Welcome To My Channel', '📱 Forms App for Beginners 👨🏽‍💻',
      'assets/tutorial/1.png'),
  //Dos
  SlideInfo('Welcome To My Channel', '📱 Forms App for Beginners 👨🏽‍💻',
      'assets/tutorial/1.png'),
];

//Creación de la pantalla

class TutorialScreen extends StatefulWidget {
  //Propiedades de la clase

  //Constructor
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  //Propieades

  //? CREAMOS UNA VARIABLE PARA EL CONTROLADOR
  late final PageController pageviewController = PageController();

  //? si ya termino de hacer scroll SE MUESTRA EL BOTÓN
  bool endReached = false;

//Iniciacion
  @override
  void initState() {
    super.initState();
    //
    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
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

//Cerramos
  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedaedes del Objeto

    //!Widget Padre
    return Scaffold(
      //Cuerpo
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            //Colocamos una animación al scroll
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          //Botón de navegación
          endReached
              ? Positioned(
                  right: 30,
                  bottom: 30,
                  child: FadeInRight(
                    //le añadimos un delay
                    delay: const Duration(milliseconds: 1),
                    //
                    from: 15,
                    child: FilledButton(
                      onPressed: () => context.push('/new-user'),
                      child: const Text('Start Now'),
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

//Creamos un nuevo Widget
class _Slide extends StatelessWidget {
  //Propieades de la clase

  //?
  final String title;
  final String caption;
  final String imageUrl;

  //Constructor
  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

//Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //? Opciones de tamaño para el titulo
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    //? Opciones de tamaño para el caption
    final captionStyle = Theme.of(context).textTheme.titleMedium;

    //!Widget Hijo
    return SizedBox.expand(
      //Utilizamos un expanded para que la imagen tome toda la pantalla
      child: Stack(
        //Utilizamos un Stack para que puedan haber otros objetos encima de la imagen
        children: [
          //Colocamos la imange y le damos un Fit.cover para que ocupe todo el espacio
          Positioned.fill(
            child: Image(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),

          //Colocamos un container para poder utilizar un gradinete
          Container(
            //Decoramos el contenedor con el gradiente
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.bottomLeft),
            ),
            //Centramos todos los objetos que esten dentro del contenedor
            child: Center(
              //Añadimos una columna
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(title, style: titleStyle),
                  const SizedBox(height: 20),
                  Text(caption, style: captionStyle)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

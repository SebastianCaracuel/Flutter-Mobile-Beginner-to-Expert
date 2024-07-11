//? Esta es la screen del Tutorial

//Importaciones Flutter
import 'package:flutter/material.dart';
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
  //Tres
  SlideInfo('Welcome To My Channel', '📱 Forms App for Beginners 👨🏽‍💻',
      'assets/tutorial/1.png'),
];

//Creación de la pantalla

class TutorialScreen extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const TutorialScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedaedes del Objeto

    //!Widget Padre
    return Scaffold(
      //Cuerpo
      body: PageView(
        //Colocamos una animación al scroll
        physics: const BouncingScrollPhysics(),
        children: slides
            .map((slideData) => _Slide(
                title: slideData.title,
                caption: slideData.caption,
                imageUrl: slideData.imageUrl))
            .toList(),
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

    //!Widget Hijo
    return Container();
  }
}

//IMportaciones flutter
import 'package:flutter/material.dart';
//IMportaciones nuestras

//Creamos el widget
class CustomButtomBar extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const CustomButtomBar({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widget padre
    return BottomNavigationBar(
      //Le quitamos la línea que se ve en la barra se llama "elevación"
      elevation: 0,
      //Tenemos que colocar los items que tendrá nuestra barra de navegación inferior
      items: const [
        //todo: Creamos el primer item - home
        BottomNavigationBarItem(
          //iconos de home
          icon: Icon(Icons.home_max_rounded),
          //label - o texto
          label: 'Home',
        ),

        //todo: creamos el segundo item - categoria
        BottomNavigationBarItem(
          //ICONO categoria
          icon: Icon(Icons.label_outline_rounded),
          //nombre
          label: 'Category',
        ),

        //todo: creamos el tercer item - Favoritos
        BottomNavigationBarItem(
          //icono  - FAV
          icon: Icon(Icons.favorite_border_rounded),
          //Nombre
          label: 'Favorite',
        ),
      ],
    );
  }
}

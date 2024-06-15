//IMportaciones flutter
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//IMportaciones nuestras

//Creamos el widget
class CustomButtomBar extends StatelessWidget {
  //Propiedades de la clase

  //?Variable para que se mantenga activada el icono de navegación
  int getCurrentIndex(BuildContext context) {
    //
    final String location = GoRouterState.of(context).matchedLocation;

    //
    switch (location) {
      case '/':
        return 0;

      case '/category':
        return 1;

      case '/favorites':
        return 2;

      default:
        return 0;
    }
  }

  //?Creamos un método
  void onItemTapped(BuildContext context, int index) {
    //Utilizamos un Switch basado en el Index
    switch (index) {
      //Cuando se hace click en la primera opción
      case 0:
        //Va a navegar al Home
        context.go('/');
        //Se utiliza el Break para que luego de la navegación no haga nada más
        break;

      //Cuando se hace click en la primera opción
      case 1:
        //Va a navegar a las categorias
        context.go('/');
        //Se utiliza el Break para que luego de la navegación no haga nada más
        break;

      //Cuando se hace click en la primera opción
      case 2:
        //Va a navegar a los Favoritos
        context.go('/favorites');
        //Se utiliza el Break para que luego de la navegación no haga nada más
        break;
    }
  }

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
      //Llamamos a la variable para que cambie el icono dependiendo de la navegación
      currentIndex: getCurrentIndex(context),
      //Colocamos un onTap para poder llamar a nuestro método de navegación
      onTap: (index) => onItemTapped(context, index),
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

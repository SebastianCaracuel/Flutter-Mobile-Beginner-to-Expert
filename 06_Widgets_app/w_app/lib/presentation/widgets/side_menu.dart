import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_app/config/menu/menu_items.dart';

//Clase
class SideMenu extends StatefulWidget {
  //Propiedades

  //Quiero que me especifiquen el key
  final GlobalKey<ScaffoldState> scaffoldKey;

  //Constructor
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

//State
class _SideMenuState extends State<SideMenu> {
  //Creamos una propiedad
  int navDrawerIndex =
      0; //?Esto me va a permitir saber cual de las opciones del menú es la que esta seleccionada

  @override
  Widget build(BuildContext context) {
    //!Importante //?Determinado el Notch
    final hasNotch = MediaQuery.of(context).viewPadding.top >
        35; //Esto nos ayuda a saber cual es la distancia que tenemos en el Top

    //Llamamos a un widget navigationDrawer para que tenga la función del menu lateral
    return NavigationDrawer(
      //Colocamos un selectdIndex para saber donde estamos y que quede presionado el botón
      selectedIndex: navDrawerIndex,
      //Llamamos al onTap predeterminado del Drawer para poder realizar la condición de "donde estamos"
      onDestinationSelected: (value) {
        //llamamos  aun setState
        setState(() {
          //nuestro index lo pasamos al value y ya debería funcionar los OnTap y que cambie nuestra posición en los componentes
          navDrawerIndex = value;
        });

        //!Navegación
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);

        //Llamamos a nuestro scaffoldKey para que se cierre cada vez que viajamos a una pantalla por nuestro menu
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        //Creamos un padding y al padding le agregamos nuestro Notch
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Principal Options'),
        ),

        //todo: Llamamos a nuestros componentes ya hechos //?MenuItems
        ...appMenuItems
            //Creamos una sublista - Nos permite solo los primeros 3 elementos de nuestra lista
            .sublist(0, 3)
            .map((item) => NavigationDrawerDestination(
                  //Icono
                  icon: Icon(item.icon),
                  //Texto
                  label: Text(item.title),
                )),

        //Creamos una barrita divisoria
        const Padding(
            //Asiganmos le padding
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            //Le colocamos un Divider - un diver es una división el padding es para ver cuanto esta dividido
            child: Divider()),

        //Colocamos nuevamente un padding
        //Creamos un padding y al padding le agregamos nuestro Notch
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('Secondary Options'),
        ),

        //Creamos otra ve los items
        ...appMenuItems
            //Creamos una sublista - Nos permite solo los primeros 3 elementos de nuestra lista
            .sublist(3)
            .map((item) => NavigationDrawerDestination(
                  //Icono
                  icon: Icon(item.icon),
                  //Texto
                  label: Text(item.title),
                )),
      ],
    );
  }
}

import 'package:flutter/material.dart';

//Clase
class SideMenu extends StatefulWidget {
  //Constructor
  const SideMenu({super.key});

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
      },
      children: const [
        //Llamamos a nuestros componentes ya hechos //?MenuItems

        //Construimos unas opciones de menu - solo para aprender a como utilizarlo
        NavigationDrawerDestination(
            //Icono
            icon: Icon(Icons.add),
            //Texto
            label: Text('Home Screen')),

        //Construimos unas opciones de menu - solo para aprender a como utilizarlo
        NavigationDrawerDestination(
            //Icono
            icon: Icon(Icons.expand_less_rounded),
            //Texto
            label: Text('Hello World')),
      ],
    );
  }
}

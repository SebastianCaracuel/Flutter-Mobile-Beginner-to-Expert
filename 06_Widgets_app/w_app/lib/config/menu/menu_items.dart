import 'package:flutter/material.dart';
//Creamos un archivo para el menu

//Creamos una clase

class MenuItem {
  //PROPIEDADES
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

//Constructor con los parametros
  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

//Creamos una constante del menuItems
const appMenuItems = <MenuItem>[
  //Primer Widgets a utilizar - Botones
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios Botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),

  //Segundo Widgets a utilizar - Tarjetas
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),

  //Tercer Widgets a utilizar - ProgressIndicators
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),

  //Cuarto Widgets a utilizar - Snackbars
  MenuItem(
      title: 'SnackBars and Dialogs',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline_rounded),
];

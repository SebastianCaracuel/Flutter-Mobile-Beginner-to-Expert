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
      link: '/card',
      icon: Icons.credit_card),
];

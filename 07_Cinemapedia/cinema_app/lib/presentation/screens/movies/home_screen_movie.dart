//Importaciones de Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/widgets/widgets.dart';

//Creamos la clases
class HomeScreen extends StatelessWidget {
  //Propiedades de la clase
  //?Nombre de la screen
  static const name = 'home_screen';

  //Creamos una nueva propiedad para la vista
  final Widget childView;

  //Constructor de la clase
  const HomeScreen({super.key, required this.childView});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widgets
    return Scaffold(
      //Extraemos nuestro widget
      body: childView,

      //Barra de navegación
      bottomNavigationBar: const CustomButtomBar(),
    );
  }
}

//Importaciones de Flutter
import 'package:flutter/material.dart';
//Importaciones nuestras
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:cinema_app/presentation/views/views.dart';

//Creamos la clases
class HomeScreen extends StatelessWidget {
  //Propiedades de la clase
  //?Nombre de la screen
  static const name = 'home_screen';

  //Creamos una nueva propiedad para la vista
  final int pageIndex;

  //Constructor de la clase
  const HomeScreen({super.key, required this.pageIndex});

  //?Creamos un listados
  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(), //<---Categorias View
    FavoritesViews(),
  ];

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widgets
    return Scaffold(
      //Extraemos nuestro widget
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),

      //Barra de navegación
      bottomNavigationBar: const CustomButtomBar(),
    );
  }
}

import 'package:flutter/material.dart';

//Creamos nuestra Screen
class SnackbarScreen extends StatelessWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'snackbar_screen';

  //Constructor
  const SnackbarScreen({super.key});

  //Creamos una condición para mostrar el mensaje personalizado
  void showCustomSnackbar(BuildContext context) {
    //Quiero ocultar mi snackbar anterior cada vez que quiero ver un nuevo snackbar

    ScaffoldMessenger.of(context).clearSnackBars();

    //Creamos el snackbar personalizado
    final snackbar = SnackBar(
      //Contenido del SnackBar
      content: const Text('Hello Flutter'),
      //Un action es botón que se encuentra dentro de nuestro snacknar
      action: SnackBarAction(label: 'Close', onPressed: () {}),
      //Le colocamos también una duración
      duration: const Duration(seconds: 2),
    );

    //Le pasamos la propiedad
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  //todo: Creamos un metodo que no va a regresar nada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creamos un appbar para poder visualizar el nombre de la pantalla en la que nos encontramos y el button back
      appBar: AppBar(title: const Text('Snackbars and Dialogs')),

      //Creamos un botón flotante extendido
      floatingActionButton: FloatingActionButton.extended(
          //Funcionalidad
          onPressed: () => showCustomSnackbar(context),
          //Texto
          label: const Text('Show SnackBar'),
          //Icono del botón
          icon: const Icon(Icons.remove_red_eye_rounded)),
    );
  }
}

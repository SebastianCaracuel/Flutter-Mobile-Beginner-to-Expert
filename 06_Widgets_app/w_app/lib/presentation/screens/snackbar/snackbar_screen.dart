import 'package:flutter/material.dart';

//Creamos nuestra Screen
class SnackbarScreen extends StatelessWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'snackbar_screen';

  //Constructor
  const SnackbarScreen({super.key});

  //todo: Creamos un metodo que no va a regresar nada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creamos un appbar para poder visualizar el nombre de la pantalla en la que nos encontramos y el button back
      appBar: AppBar(title: const Text('Snackbars and Dialogs')),

      //Creamos un botón flotante extendido
      floatingActionButton: FloatingActionButton.extended(
          //Funcionalidad
          onPressed: () {
            //Mostramos un SnackBar con el scaffold
            ScaffoldMessenger.of(context).showSnackBar(
                //SnackBar - Mensaje
                const SnackBar(content: Text('Hello Flutter!')));
          },
          //Texto
          label: const Text('Show SnackBar'),
          //Icono del botón
          icon: const Icon(Icons.remove_red_eye_rounded)),
    );
  }
}

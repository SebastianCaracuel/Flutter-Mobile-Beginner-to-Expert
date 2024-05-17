import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      content: const Text(
        'www.linkedin/in/sebastiancaracuelgonzalez.com',
        //Estilo del texto
        style: TextStyle(
            //Tamaño
            fontSize: 10,
            fontWeight: FontWeight.w500),
      ),
      //Un action es botón que se encuentra dentro de nuestro snacknar
      action: SnackBarAction(label: 'GO!', onPressed: () {}),
      //Le colocamos también una duración
      duration: const Duration(seconds: 2),
    );

    //Le pasamos la propiedad
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  //Creamos un nuevo metodo para un Dialogo personalizado
  void openDialog(BuildContext context) {
    //Llamamos un metodo que se llama showdialog
    showDialog(
        //Esto no lo permite al usuario cerrar el dialogo hasta que presione el botón de cerrar.
        barrierDismissible: false,
        //Context que ya viene por defecto
        context: context,
        //El builder es algo que se va a construir en tiempo de ejecución
        //Colocamos un alerDialog que es casi lo mismo que el de las licencias pero podemos especificar las cosas a nuestro gusto
        builder: (context) => AlertDialog(
              //Titulo de nuestro dialogo
              title: const Text('Customized Dialog🚀'),
              //Contenido de nuestro dialogo
              content: const Text(
                  'Hello!👋🏽. This is a Personalized Dialog. Like the video👍🏽.'),
              //Creamos los botones para la acción.
              actions: [
                //Creamos un botón
                TextButton(
                    //Cerramos nuestro dialogo
                    onPressed: () => context.pop(),
                    //Label del primer primer botón
                    child: const Text('Close')),
                FilledButton(
                    onPressed: () => showCustomSnackbar(context),
                    child: const Text('Suscribe'))
              ],
            ));
  }

  //todo: Creamos un metodo que no va a regresar nada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creamos un appbar para poder visualizar el nombre de la pantalla en la que nos encontramos y el button back
      appBar: AppBar(title: const Text('Snackbars and Dialogs')),

      //Creamos una columna para mostrar un texto que explique un poco de que va la aplicación
      body: Center(
        //Colocamos un Row para ver los dos botones presentes.
        child: Row(
          //Colocamo sun MainAxis para alinear el botón al centro
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //COlocamos un botón para ver las licencias en modo dialogo
            FilledButton.tonal(
                //Función para mostrar las licencias
                onPressed: () {
                  //mostramos las licencias en un Dialogo
                  showAboutDialog(
                      //Llamamos al dialogo
                      context: context,
                      //Queremos el contenido para eso debemos usar el children
                      children: [
                        const Text(
                            '👋🏽Hello! Welcome to the snackbar and dialogs, in this dialog we will see the licenses that flutter has in this project. We continue learning!🚀')
                      ]);
                },
                //Colocamos el texto de lo que será nuestro botón.
                child: const Text('Licenses used')),

            //Creamos otro botón para ver un dialogo cualquiera.
            FilledButton.tonal(
                //? funcion -  utilizamos nuestro dialogo personalizado que asignamos arriba

                onPressed: () => openDialog(context),
                //Colocamos el texto de lo que será nuestro botón.
                child: const Text('Show Dialogs')),
          ],
        ),
      ),

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

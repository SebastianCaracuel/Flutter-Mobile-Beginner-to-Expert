import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//Creamos el Archivo o screen para Botones

class ButtonsScreen extends StatelessWidget {
  //Creamos la ruta estatica para el nombre de la screen
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      //ButtonsView
      body: const _ButtonsView(),

      //Creamos el primer botón - La función es volver atras.
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //Esta función es para volver atras o quitar la pantalla que tenemos en frente
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
    );
  }
}

//Extrajimos nuestro Widget para que nuestro scaffold no sea tan largo.
class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    //Creamos una propiedad para llamar a nuestro tema o estilo - colores
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      //Especificamos el tamaño de nuestro size box - Utilizamos double infity que significa que tome el espacio que pueda llegar el padre
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //El Wrap es similar a las columnas pero en horizontal
        child: Wrap(
          //Colocamos un espacio entre botones con spacing
          spacing: 10,
          //No nos gusta que los botones esten desalineados - Alineamos los widgets al centro
          alignment: WrapAlignment.center,
          children: [
            //Creamos nuestro primer botón dentro de nuestro Wrap (Elevated button)
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),

            //Creamos nuestro Segundo botón dentro de nuestro Wrap (Elevated button) - este botón esta desabilitado
            const ElevatedButton(
                onPressed: null, child: Text('Elevated Disable')),

            //Creamos nuestro Tercer botón (Elevated button icon) -
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.image_search_rounded),
                label: const Text('Elevated Icon')),

            //Creamos el Cuarto Botón (FielledButton) -
            FilledButton(onPressed: () {}, child: const Text('Filled')),

            //Creamos el Quinto Botón (FielledButton Icons) -
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.public),
                label: const Text('data')),

            //Creamos el Sexto Botón ( outlineButton)
            const OutlinedButton(onPressed: null, child: Text('Outline')),

            //Creamos el Septimo Botón ( outlineButton icon)
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.android_rounded),
                label: const Text('OutlineIcon')),

            //Creamos el Octavo Botón ( TextButton)
            TextButton(onPressed: () {}, child: const Text('TextButton')),

            //Creamos el Noveno Botón ( TextButton icon)
            TextButton.icon(
                onPressed: () {},
                label: const Text('TextButton'),
                icon: const Icon(Icons.terminal_rounded)),

            //Creamos el Decimo Botón ( IconButton)
            const IconButton(
                onPressed: null, icon: Icon(Icons.do_not_disturb_alt_outlined)),

            //Creamos el OnceAvo Botón ( IconButton con style)
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.lock_outline_rounded),
                style: ButtonStyle(
                    //Colocamos el color del botón que sea de nuestra gama de colores
                    backgroundColor: MaterialStatePropertyAll(colors.primary),
                    //Colocamos el color de nuestro icono
                    iconColor: const MaterialStatePropertyAll(Colors.white)))

            //Todo: Custom Button
          ],
        ),
      ),
    );
  }
}

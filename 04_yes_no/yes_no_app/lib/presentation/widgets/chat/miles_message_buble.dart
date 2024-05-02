import 'package:flutter/material.dart';

class MilesMessageBubble extends StatelessWidget {
  const MilesMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    //?! Llamamos a nuestro color del Theme
    final colors = Theme.of(context).colorScheme;

    return Column(
      //Llevamos los datos alineados a la izq
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Creamos un contenedor
        Container(
          //Dejamos una Decoración dentro de nuestro contenedor
          decoration: BoxDecoration(
              //?Personalizamos el color dependiendo de nuestro Theme
              color: colors.secondary,
              //?No queremos que nuestro contendor sea Cuadrado, queremos que sea redondo.
              borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Seba',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        // Todo:imagen
        const _ImageBubble()
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble();

  @override
  Widget build(BuildContext context) {
    return Image.network(
        'https://yesno.wtf/assets/no/2-101be1e3d8a0ed407c4e3c001ef8fa66.gif');
  }
}

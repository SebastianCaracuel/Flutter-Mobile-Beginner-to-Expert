import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    //?! Llamamos a nuestro color del Theme
    final colors = Theme.of(context).colorScheme;

    return Column(
      //Llevamos los datos alineados a la derecha
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //Creamos un contenedor
        Container(
          //Dejamos una Decoración dentro de nuestro contenedor
          decoration: BoxDecoration(
              //?Personalizamos el color dependiendo de nuestro Theme
              color: colors.primary,
              //?No queremos que nuestro contendor sea Cuadrado, queremos que sea redondo.
              borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

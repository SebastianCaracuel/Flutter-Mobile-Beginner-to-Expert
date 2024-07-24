import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    //?! Llamamos a nuestro color del Theme
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MilesMessageBubble extends StatelessWidget {
//Creamos una propiedad
  final Message message;

  const MilesMessageBubble({super.key, required this.message});
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),

        // Todo:imagen
        _ImageBubble(message.imageUrl!),

        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //ClipRRect nos permite hacer Bordes redondeados
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,

        //Queremos que la imagen tome un tamaño en particular
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,

        //Queremos mostrar un mensaje mientras carga la Imagen
        //?Builder, algo que se construirá en tiempo de ejecución
        loadingBuilder: (context, child, loadingProgress) {
          //
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Miles, está enviando un Mensaje.."),
          );
        },
      ),
    );
  }
}

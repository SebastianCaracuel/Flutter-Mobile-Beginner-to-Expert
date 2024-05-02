import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    //? Colocamos un textController
    final textController = TextEditingController();

    //?El focus node es cuando un elemento necesita un foco
    final focusNode = FocusNode();

    //Creamos también un Borde Personalizado para una mejor visualización del Input
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    //?Creamos un decorador de Input Personalizado
    final inputDecoraction = InputDecoration(
      //Creamos un HinText para que nuestro input tenga un texto para que se entienda la dinamica.
      //Este texto esta sobrepuesto
      hintText: 'Termina tu Mensaje con "?" ',
      //Colocamos un borde al Input, un color y además lo redondeamos
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      //Creamos un Botón con Icono a la Derecha.
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          print('Button $textValue');
          textController.clear();
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    //!? Creamos un TextFormField donde colocatremos nuestro Input Personalizado
    return TextFormField(
      //Colocamos el textController
      controller: textController,
      //Elemento FOCUS
      focusNode: focusNode,
      //Para presionar afuera y que se pierda el focus
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      //Le colocamos decoración
      decoration: inputDecoraction,
      //Vemos el valor de lo que se esta escribiendo en la caja de texto
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}

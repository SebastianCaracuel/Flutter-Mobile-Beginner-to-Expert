//Importaciones flutter
import 'package:flutter/material.dart';

//Importaciones nuestras

//? Este será un Widget, del diseño del TextFormField

//Creamos la clase
class CustomTextFormField extends StatelessWidget {
  //Propiedades

  //Constructor
  const CustomTextFormField({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //? Utilizamos los colores de nuestra aplicación
    final colors = Theme.of(context).colorScheme;

    //? creamos una variable para añadir un borde a nuestro campo de Texto
    final border = OutlineInputBorder(
        //Le añadimos el color al borde, un color que diferencie del color activo
        borderSide: const BorderSide(color: Colors.white54),
        //Le añadimos un borde redondeado para que se pueda lucir bonito
        borderRadius: BorderRadius.circular(40));

    //!Widget Padre
    return TextFormField(
      //? obscureText: true, //! Esto es por si se esta escribiendo una contraseña coloca lo escrito en ( **** )

      // Función que se llama cada vez que el valor del campo de texto cambia.
      onChanged: (value) {
        print('value: $value'); // Imprime el valor actual del campo de texto.
      },

      // Función que valida el valor del campo de texto.
      validator: (value) {
        // Si el valor es nulo, devuelve el mensaje de error 'Campo es Requerido'.
        if (value == null) return 'Campo es Requerido';

        // Si el valor es una cadena vacía, devuelve el mensaje de error 'Campo es Requerido'.
        if (value.isEmpty) return 'Campo es Requerido';

        // Si el valor contiene solo espacios en blanco, devuelve el mensaje de error 'Campo es Requerido'.
        if (value.trim().isEmpty) return 'Campo es Requerido';

        // Si todas las validaciones anteriores pasan, devuelve null indicando que el valor es válido.
        return null;
      },
      //Esto es para la decoración del campo de texto
      decoration: InputDecoration(
          //Llamamos a utilizar la variable que definimos arriba para que el campo tenga un borde
          enabledBorder: border,
          //Le añadimos un color al borde, cuando esta activo es decir cuando se esta escribiendo en el TextFormField
          focusedBorder:
              //El color utilizado es el color de la aplicación, un color morado.
              border.copyWith(borderSide: BorderSide(color: colors.primary))),
    );
  }
}

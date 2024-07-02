//Importaciones flutter
import 'package:flutter/material.dart';

//Importaciones nuestras

//? Este será un Widget, del diseño del TextFormField

//Creamos la clase
class CustomTextFormField extends StatelessWidget {
  //Propiedades

  // ? Creamos una variable que nos permitirá que el Texto sea Opcional o requerido
  final String? label;
  // ? Creamos una variable que nos permitirá que el Texto sea Opcional o requerido
  final String? hint;
  // ? Creamos una variable que nos permitirá que el Error sea Opcional o requerido
  final String? errorMessage;

  // ? Creamos una variable que nos permitirá definir una función que se ejecutará cada vez que el valor del campo de texto cambie.
  final Function(String)? onChanged;

  // ? Creamos una variable que nos permitirá validar, siendo opcional o requerido
  final String? Function(String?)? validator;

  //Constructor
  const CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator});

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
      onChanged: onChanged,
      // Función que valida el valor del campo de texto.
      validator: validator,
      // Validator: (value) { //? Esta era la validación antes de hacerlo Opcional
      //   // Si el valor es nulo, devuelve el mensaje de error 'Campo es Requerido'.
      //   if (value == null) return 'Campo es Requerido';
      //   // Si el valor es una cadena vacía, devuelve el mensaje de error 'Campo es Requerido'.
      //   if (value.isEmpty) return 'Campo es Requerido';
      //   // Si el valor contiene solo espacios en blanco, devuelve el mensaje de error 'Campo es Requerido'.
      //   if (value.trim().isEmpty) return 'Campo es Requerido';
      //   // Si todas las validaciones anteriores pasan, devuelve null indicando que el valor es válido.
      //   return null;
      // },

      //Esto es para la decoración del campo de texto
      decoration: InputDecoration(
        //Llamamos a utilizar la variable que definimos arriba para que el campo tenga un borde
        enabledBorder: border,
        //Le añadimos un color al borde, cuando esta activo es decir cuando se esta escribiendo en el TextFormField
        focusedBorder:
            //El color utilizado es el color de la aplicación, un color morado.
            border.copyWith(borderSide: BorderSide(color: colors.primary)),
        //Creamos un Diseño para el Error Border
        errorBorder:
            //El color utilizado es el color de la aplicación, un color rojo.
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        // Creamos un Diseño para el Error Border.
        focusedErrorBorder: //El color utilizado es el color de la aplicación, un color rojo.
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),

        //No queremos que el campo sea tan grande, Hace que el campo de texto sea más compacto
        isDense: true,
        //Proporciona una etiqueta que se muestra dentro del campo de texto cuando está vacío.
        label: label != null ? Text(label!) : null,
        // Muestra un texto de sugerencia dentro del campo de texto cuando está vacío, proporcionando una pista al usuario sobre qué escribir
        hintText: hint,
        // El color que se usa cuando el campo de texto tiene el foco (está seleccionado).
        focusColor: colors.primary,
        //Esto es un indicador, le indica al Usuario que hay un error en el campo de Texto
        errorText: errorMessage,
        //Utilizamos un PreFixIcon que nos permite tener un Icono dentro de nuestro
        prefixIcon: Icon(
            //Le añadimos un Icono referente al campo
            Icons.supervised_user_circle_rounded,
            //Añadimos el color primario de la aplicación
            color: colors.primary),
        // ? Este es un Icono que nos permite colocar dentro de nuestro campo de texto, pero al final
        // suffixIcon: Icon(Icons.supervised_user_circle, color: colors.primary),
        // ? Este es un Icono fuera del campo de texto
        // icon: Icon(Icons.supervised_user_circle, color: colors.primary),
      ),
    );
  }
}

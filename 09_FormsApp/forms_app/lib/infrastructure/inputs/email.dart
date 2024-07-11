//? Creamos el Input personalizado para el correo electronico o E-mail

//Importaciones flutter
import 'package:formz/formz.dart';

// Define los errores de validación de la entrada
enum EmailError { empty, format }

// Extiende FormzInput y proporciona el tipo de entrada y el tipo de error.
class Email extends FormzInput<String, EmailError> {
  //? Todo : Creamos una expresión regular para el formato del correo electronico
  static final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // Llama a super.pure para representar una entrada de formulario no modificada.
  const Email.pure() : super.pure('');

  // Llama a super.dirty para representar una entrada de formulario modificada.
  const Email.dirty(super.value) : super.dirty();

  //todo: Mensaje de error
  String? get errorMessage {
    //preguntamos si es valido
    if (isValid || isPure) return null;

    //Este error muestra un mensaje que dice que el campo es requerido
    if (displayError == EmailError.empty) return 'Filed is Required';
    // Este es un mensaje de error que muestra que el campo debe tener minimo 6 caracteres
    if (displayError == EmailError.format) return 'No Email Format';

    //
    return null;
  }

  // Sobrescribe el validador para manejar la validación de un valor de entrada dado.
  @override
  EmailError? validator(String value) {
    //todo: validaciones

    //Si el campo esta vació lanzamos un error
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;

    //Utilizamos el método del formato para el correo
    if (!emailRegExp.hasMatch(value)) return EmailError.format;

    //
    return null;
  }
}

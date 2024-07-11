//? Creamos el Input personalizado

//Importaciones Flutter
import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(super.value) : super.dirty();

  //todo: Mensaje de error
  String? get errorMessage {
    //preguntamos si es valido
    if (isValid || isPure) return null;

    //Este error muestra un mensaje que dice que el campo es requerido
    if (displayError == PasswordError.empty) return 'Filed is Required';
    // Este es un mensaje de error que muestra que el campo debe tener minimo 6 caracteres
    if (displayError == PasswordError.lenght) return 'Minimum 6 characters';

    //
    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    //todo: validaciones

    //Si el campo esta vació lanzamos un error
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;

    //si el campo es menos de 6 caracteres, mandamos el error
    if (value.length < 6) return PasswordError.lenght;

    //Retornamos
    return null;
  }
}

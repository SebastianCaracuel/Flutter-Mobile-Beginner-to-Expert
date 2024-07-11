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

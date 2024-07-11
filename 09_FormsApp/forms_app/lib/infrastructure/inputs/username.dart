//Importaciones flutter
import 'package:formz/formz.dart';

// Define los errores de validación de la entrada
enum UsernameError { empty, lenght }

// Extiende FormzInput y proporciona el tipo de entrada y el tipo de error.
class Username extends FormzInput<String, UsernameError> {
  // Llama a super.pure para representar una entrada de formulario no modificada.
  const Username.pure() : super.pure('');

  // Llama a super.dirty para representar una entrada de formulario modificada.
  const Username.dirty(super.value) : super.dirty();

  // Sobrescribe el validador para manejar la validación de un valor de entrada dado.
  @override
  UsernameError? validator(String value) {
    //todo: validaciones

    //Si el campo esta vació lanzamos un error
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;

    //si el campo es menos de 6 caracteres, mandamos el error
    if (value.length < 6) return UsernameError.lenght;

    //
    return null;
  }
}

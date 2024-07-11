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

  //todo: Mensaje de error
  String? get errorMessage {
    //preguntamos si es valido
    if (isValid || isPure) return null;

    //Este error muestra un mensaje que dice que el campo es requerido
    if (displayError == UsernameError.empty) return 'Filed is Required';
    // Este es un mensaje de error que muestra que el campo debe tener minimo 6 caracteres
    if (displayError == UsernameError.lenght) return 'Minimum 6 characters';

    //
    return null;
  }

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

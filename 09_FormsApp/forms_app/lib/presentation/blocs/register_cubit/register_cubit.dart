//Importaciones flutter
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

//Importaciones nuestras
import 'package:forms_app/infrastructure/inputs.dart';

//Conexion con otro archivo
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

// Método que se llama cuando se envía el formulario.
  void onSubmit() {
    // Imprime el estado actual del formulario en la consola.
    print('Submit: $state');
  }

//todo:Métodos para actualizar el estado del formulario

// Método que se llama cuando el valor del campo de texto 'username' cambia.
  void usernameChanged(String value) {
    //Creamos un campo, con una nueva instancia "dirty(Sucia)" con el valor que me estan mandando
    final username = Username.dirty(value);

    // Emite un nuevo estado del formulario con el valor actualizado del nombre de usuario.
    emit(state.copyWith(
        username: username,
        //Si el username cambia, validamos el cambio
        isValid: Formz.validate([username])));
  }

// Método que se llama cuando el valor del campo de texto 'email' cambia.
  void emailChanged(String value) {
    // Emite un nuevo estado del formulario con el valor actualizado del correo electrónico.
    emit(state.copyWith(
      email: value,
    ));
  }

// Método que se llama cuando el valor del campo de texto 'password' cambia.
  void passwordChanged(String value) {
    // Emite un nuevo estado del formulario con el valor actualizado de la contraseña.
    emit(state.copyWith(
      password: value,
    ));
  }
}

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
    //? Colocamos nuestro OnSubmit en un nuevo estado
    emit(state.copyWith(
        formstatus: FormStatus.validating,
        username: Username.dirty(state.username.value),
        password: Password.dirty(state.password.value),
        //email: Email.dirty(state.email.value),
        isValid:
            Formz.validate([state.username, state.password, state.email])));
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
        isValid: Formz.validate([username, state.password])));
  }

// Método que se llama cuando el valor del campo de texto 'email' cambia.
  void emailChanged(String value) {
    //? Creamos la variable que utilizaremos, para guardar nuestro Email (input)
    final email = Email.dirty(value);
    // Emite un nuevo estado del formulario con el valor actualizado del correo electrónico.
    emit(state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.username, state.password])));
  }

// Método que se llama cuando el valor del campo de texto 'password' cambia.
  void passwordChanged(String value) {
    //? Creamos una variable para llamar a nuestro input personalizado
    final password = Password.dirty(value);
    // Emite un nuevo estado del formulario con el valor actualizado de la contraseña.
    emit(state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username])));
  }
}

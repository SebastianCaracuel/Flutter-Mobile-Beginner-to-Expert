//Importaciones flutter
import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'package:teslo_shop_app/features/shared/shared.dart';

//?1 Paso uno - Crear el estado(State) del Provider (StateNotifierProvider)

//Definimos el state
class LoginFormState {
  //Propiedades

  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  //Constructor con los parametros(Propieades)
  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  //Creamos un Copywith()
  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  //Sobreescribimos el ToString() para poder mandar los datos por consola
  @override
  String toString() {
    return '''
  LoginFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    email: $email
    password: $password
  ''';
  }
}

//?2 - Como implementamos el Notifier
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  //todo: Creamos un método ( cuando cambia el EMAIL )
  onEmailChange(String value) {
    //Creamos una propiedad para obtner el Email.
    final newEmail = Email.dirty(value);

    //
    state = state.copyWith(
      //Verificamos si el Fomulario es valido o no
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  //todo: Creamos un método ( Cuando cambia la contraseña )
  onPasswordChanged(String value) {
    //Creamos una propiedad para obtner el Password.
    final newPassword = Password.dirty(value);

    //
    state = state.copyWith(
      //Verificamos si el Fomulario es valido o no
      password: newPassword,
      isValid: Formz.validate([newPassword, state.email]),
    );
  }

  //todo: Creamos un nuevo método ( submit ) o envio
  onFormSubmit() {
    //Llamamos a nuestro validador
    _touchEveryField();

    //Realizamos un IF ( Si el State es valido, que no haga nada)
    if (!state.isValid) return;

    //SI todo esta bien entonces mandamos un print
    print(state);
  }

  //todo: Creamos un método privado para que al presionar el Botón todos los campos se verifiquen
  _touchEveryField() {
    //Tiramos los valores del Email de forma sucia
    final email = Email.dirty(state.email.value);
    //Tiramos los valores del Password de forma sucia
    final password = Password.dirty(state.password.value);

    //Validamos todos los datos
    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]));
  }
}

//?3 - Como consumir el Provider(StateNotifierProvider - consumir afuera)
final loginFormProvider =
    //! Al colocar un ( Autodispose ) lo que nos permite es tener los datos cuando la persona haga cerrado de sesión (Incluye la contraseña)
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});

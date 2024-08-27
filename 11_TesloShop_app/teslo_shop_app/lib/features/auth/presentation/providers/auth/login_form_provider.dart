//Importaciones flutter
import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras
import 'package:teslo_shop_app/features/shared/shared.dart';
import 'package:teslo_shop_app/features/auth/presentation/providers/providers.dart';

//!3 - Como consumir el Provider(StateNotifierProvider - consumir afuera)
final loginFormProvider =
    //? Al colocar un ( Autodispose ) lo que nos permite es tener los datos cuando la persona haga cerrado de sesión (Incluye la contraseña)
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  //método
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;

  return LoginFormNotifier(loginUserCallback: loginUserCallback);
});

//!2 - Como implementamos el Notifier
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  //Llamamos a la función loginUserCallback
  final Function(String, String) loginUserCallback;

  LoginFormNotifier({
    required this.loginUserCallback,
  }) : super(LoginFormState());

  //todo: Creamos un método ( cuando cambia el EMAIL )
  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail, isValid: Formz.validate([newEmail, state.password]));
  }

  //todo: Creamos un método ( Cuando cambia la contraseña )
  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email]));
  }

  //todo: Creamos un nuevo método ( submit ) o envio
  onFormSubmit() async {
    _touchEveryField();

    //Si el formulario es valido
    if (!state.isValid) return;

    //El posteo esta en true
    state = state.copyWith(isPosting: true);

    //Se realiza la autenticación de los datos.
    await loginUserCallback(state.email.value, state.password.value);

    //Cuando eso termine, sea exitoso o no, se cambiará el estado a falso.
    state = state.copyWith(isPosting: false);
  }

  //todo: Creamos un método privado para que al presionar el Botón todos los campos se verifiquen
  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]));
  }
}

//! 1 - State del provider
class LoginFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure()});

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

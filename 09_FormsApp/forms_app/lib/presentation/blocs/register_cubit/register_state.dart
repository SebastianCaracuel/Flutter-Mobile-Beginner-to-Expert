part of 'register_cubit.dart';

//? Este state será el estado del formulario

//! Definimos un enumerador llamado FormStatus que representa los posibles estados de un formulario.
enum FormStatus {
  // Estado cuando el formulario es inválido.
  invalid,

  // Estado cuando el formulario es válido.
  valid,

  // Estado cuando el formulario está en proceso de validación.
  validating,

  // Estado cuando el formulario está en proceso de envío o publicación de datos.
  posting,
}

//Clase del RegisterCubit
class RegisterFormState extends Equatable {
  //Propiedades

  //? Creamos las variables del formulario para su respectiva validación

  //Nombre de usuario
  final Username username;
  //Nombre de email
  final Email email;
  //Nombre de password
  final Password password;
  //
  final FormStatus formstatus;
  //Creamos una variable para saber si es valido
  final bool isValid;

  //Constructor
  const RegisterFormState({
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formstatus = FormStatus.invalid,
    this.isValid = false,
  });

//Creamos un método de CopyWith
  RegisterFormState copyWith({
    //Nombre de usuario
    Username? username,
    //Nombre de email
    Email? email,
    //Nombre de password
    Password? password,
    //
    FormStatus? formstatus,
    //Creamos una variable para saber si es valido
    bool? isValid,
  }) =>
      RegisterFormState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        formstatus: formstatus ?? this.formstatus,
        isValid: isValid ?? this.isValid,
      );

  @override
  List<Object> get props => [
        formstatus,
        username,
        isValid,
        email,
        password
      ]; // Retorna una lista de propiedades que determinan la igualdad del objeto
}

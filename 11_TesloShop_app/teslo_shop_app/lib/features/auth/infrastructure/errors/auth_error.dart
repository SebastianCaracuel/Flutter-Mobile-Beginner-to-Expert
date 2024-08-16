//? Creamos unos errores personalizados

//todo: Creamos un error para el tiempo de conexión
class ConnectionTimeOut implements Exception {}

//todo: Creamos un error para el Token invalido
class InvalidToken implements Exception {}

//todo: Creamos un error para las credenciales invalidas
class WrongCredentials implements Exception {}

//? Creamos un error personalizado
class CustomError implements Exception {
  //Propiedades

  final String message;
  final int errorCode;

  //Constructor
  CustomError(this.message, this.errorCode);
}

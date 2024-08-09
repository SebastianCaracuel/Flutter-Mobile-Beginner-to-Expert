//Importaciones nuestras
import 'package:teslo_shop_app/features/auth/domain/domain.dart'; //Llamamos a nuestro usuario

abstract class AuthDatasource {
  //? Este es para realizar el ingreso a la aplicación
  Future<User> login(String email, String password);

  //?
  Future<User> register(String email, String password, String fullName);

  //? Este es para identificar si la persona ya esta autenticada o no
  Future<User> checkAuthStatus(String token);
}

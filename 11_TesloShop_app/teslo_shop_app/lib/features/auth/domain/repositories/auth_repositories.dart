//Importaciones nuestras
import 'package:teslo_shop_app/features/auth/domain/domain.dart'; //Llamamos a nuestro usuario

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password, String fullName);
  Future<User> checkAuthStatus(String token);
}

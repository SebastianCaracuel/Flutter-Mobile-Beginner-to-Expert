//? Este es el archivo de datasources implemntado

//Importaciones FLutter
import 'package:dio/dio.dart';

//Importaciones nuestras
import 'package:teslo_shop_app/config/config.dart';
import 'package:teslo_shop_app/features/auth/domain/domain.dart';
import 'package:teslo_shop_app/features/auth/infrastructure/infrastructure.dart';

//Esta es la clase con extensión de nuestro Datasource para ser implementado
class AuthDatasourceImpl extends AuthDatasource {
  @override
  Future<User> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }
}

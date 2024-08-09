//? Este es el archivo de datasources implemntado

//Importaciones FLutter
import 'package:dio/dio.dart';

//Importaciones nuestras
import 'package:teslo_shop_app/config/config.dart';
import 'package:teslo_shop_app/features/auth/domain/domain.dart';
import 'package:teslo_shop_app/features/auth/infrastructure/infrastructure.dart';

//Esta es la clase con extensión de nuestro Datasource para ser implementado
class AuthDatasourceImpl extends AuthDatasource {
  //Propiedades

  //? Creamos una propiedad para utilizar Dio (La dependencia)
  final dio = Dio(
      //Llamamos a nuestra URl
      BaseOptions(baseUrl: Environment.apiUrl));
  @override
  Future<User> login(String email, String password) async {
    //Realizamos un TryCatch para verificar errores
    try {
      //Cramos una variable, donde realizamos una petición post
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      final user = UserMapper.userJsonToEntity(response.data);
      return user;

      //! Implementamos lo errores
    } catch (e) {
      //? Llamamos a nuestro error personalizado
      throw WrongCredentials();
    }
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

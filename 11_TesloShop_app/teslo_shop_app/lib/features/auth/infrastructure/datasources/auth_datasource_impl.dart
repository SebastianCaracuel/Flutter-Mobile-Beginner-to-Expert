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

  //? Creamos una propiedades para utilizar la dependencia DIO
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  //todo: Login
  @override
  Future<User> login(String email, String password) async {
    try {
      //?Creamos una variable para obtener el path de autorización y logeo
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      //? Obtenemos nuestro usuario
      final user = UserMapper.userJsonToEntity(response.data);

      //Retornamos a nuestro usuario
      return user;

      //Error
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw WrongCredentials();
      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeOut();
      }
      throw CustomError('Somenthing wrong happend', 1);
    } catch (e) {
      //Llamamos al error personalizado
      throw CustomError('Somenthing wrong happend', 1);
    }
  }

  //todo: Register
  @override
  Future<User> register(String email, String password, String fullName) {
    //! FALTA POR IMPLEMENTAR
    throw UnimplementedError();
  }

  //todo: CheckAuthStatus
  @override
  Future<User> checkAuthStatus(String token) {
    //!FALTA POR IMPLEMENTAR
    throw UnimplementedError();
  }
}

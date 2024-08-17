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
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales Incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a Internet');
      }
      throw Exception(); //Error no controlado
    } catch (e) {
      throw Exception(); //Error no controlado
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
  Future<User> checkAuthStatus(String token) async {
    //Recibir el Token
    try {
      //Utilizamos el path para revisar el estado de la autenticación
      final response = await dio.get('/auth/check-status',
          options: Options(
            //Headers
            headers: {'Authorization': 'Bearer $token'},
          ));

      //le pasamos la data al usuario
      final user = UserMapper.userJsonToEntity(response.data);
      //Retornamos el usuario
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token incorrecto'); //El token esta incorrecto
      }

      throw Exception(); //Error no controlado
    } catch (e) {
      throw Exception(); //Error no controlado
    }
  }
}

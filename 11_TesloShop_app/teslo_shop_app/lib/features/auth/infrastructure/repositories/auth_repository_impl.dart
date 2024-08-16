//? Este es el archivo de repository implemntado

//Importaciones nuestras
import 'package:teslo_shop_app/features/auth/domain/domain.dart';
import '../infrastructure.dart';

//Esta es la clase con extensión de nuestro repositorio para ser implementado
class AuthRepositoryImpl extends AuthRepository {
  //Propiedades
  final AuthDatasource dataSource;

  AuthRepositoryImpl({AuthDatasource? dataSource})
      : dataSource = dataSource ?? AuthDatasourceImpl();

  //todo:Login
  @override
  Future<User> login(String email, String password) {
    //Realizamos la validación del Login
    return dataSource.login(email, password);
  }

  //todo: register
  @override
  Future<User> register(String email, String password, String fullName) {
    //Realizamos la validación del registro
    return dataSource.register(email, password, fullName);
  }

  //todo: checkAuthStatus
  @override
  Future<User> checkAuthStatus(String token) {
    //Realizamos la validación del token
    return dataSource.checkAuthStatus(token);
  }
}

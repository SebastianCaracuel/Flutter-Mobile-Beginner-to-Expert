//?

//Importaciones Flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones Nuestras
import 'package:teslo_shop_app/features/auth/domain/domain.dart';
import 'package:teslo_shop_app/features/auth/infrastructure/infrastructure.dart';
import 'package:teslo_shop_app/features/shared/infrastructure/shared_infrastructure.dart';

//? Creamos una enumeración propia ( Tendrá 3 estados )
// #Checking = Para revisar si el Token es valido o no
// #authenticated para ver si el usuario esta autenticado o no
enum AuthStatus { checking, authenticated, notAuthenticated }

//todo: Creamos nuestra clase AuthState
class AuthState {
  //Propiedades

  final AuthStatus authStatus;
  //llamamos a nuestra entidad ( usuario ) de nuestro dominio
  final User? user;
  //Colocamos un error de mensaje
  final String errorMessage;

  //Constructor con las propiedades
  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  //Creamos un copyWith
  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}

//todo: creamos un Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  //Propiedad

  //? Llamamos a nuestro RepositorioImplementado
  final authRepository = AuthRepositoryImpl();

  //?
  final keyValueStorageService = KeyValueStorageServicesImpl();

  //Retornamos la variable
  return AuthNotifier(
      authRepository: authRepository,
      keyValueStorageService: keyValueStorageService);
});

//todo creamos un Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  //Propiedades

  //?Propiedad del repositorio
  final AuthRepository authRepository;

  //?Propiedad para la clave del servicio
  final KeyValueStorageService keyValueStorageService;
  //Constructor
  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  //? Aquí van todos los métodos

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  Future<void> logout([String? errorMessage]) async {
    //todo: limpiar token
    await keyValueStorageService.removeKey('token');

    //
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }

  void registerUser(String email, String password) async {}

  void checkAuthStatus() async {
    //El estado de la autenticación

    //Verificamos si tenemos el token
    final token = await keyValueStorageService.getValue<String>('token');

    //SI el token no existe
    if (token == null) return logout();

    //Si el Token existe
    try {
      final user = await authRepository.checkAuthStatus(token);
      _setLoggedUser(user);
    } catch (e) {
      logout(); //SI el toquen no es valido se saca nomas
    }
  }

  void _setLoggedUser(User user) async {
    //todo: Cuando yo tenga un usuario, necesito guardar el token en el Dispositivo Fisicamente
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }
}

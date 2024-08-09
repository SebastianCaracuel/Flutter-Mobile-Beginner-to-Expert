//?

//Importaciones Flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones Nuestras
import 'package:teslo_shop_app/features/auth/domain/domain.dart';
import 'package:teslo_shop_app/features/auth/infrastructure/infrastructure.dart';

//Creamos nuestro provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  //Propiedades

  //Colocamos nuestro AuthRepositoryImpl, en una variable
  //Al añadir el authreposity ya tenemos los casos de uso o métodos
  final authRepository = AuthRepositoryImpl();

  return AuthNotifier(authRepository: authRepository);
});

//Creamos un StateNotifier
class AuthNotifier extends StateNotifier<AuthState> {
  //Llamamos a nuestro repositorioIMPL
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState());

  //todo: método Login
  Future<void> loginUser(String email, String password) async {
    //Cuando realizo el login retrasaré un poco el login
    await Future.delayed(const Duration(milliseconds: 500));

    //!TryCatch
    try {
      //
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);

      //! Colocamos un error controlado referente a nuestro error personalizado
    } on WrongCredentials {
      //Como las credenciales no fueron correctas
      logout('Credenciales no son correctas');
      //! Llamamos un error no personalizado, un error no controlado
    } catch (e) {
      logout('Error no controlado');
    }

    // final user = await authRepository.login(email, password);
    // state = state.copyWith(user: user, authStatus: AuthStatus.authenticated);
  }

  //todo: método Register
  void registerUser(String email, String password) async {}

  //todo: método Checking
  void checkAuthStatus() async {}

  //todo: método de logout
  Future<void> logout([String? errorMessage]) async {
    // TODO: limpiar token
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  //todo: Creamoremos un método en el que se //! Centralizará todo
  void _setLoggedUser(User user) {
    // TODO: necesito guardar el token físicamente
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
    );
  }
}

//? Creamos una enumeración propia ( Tendrá 3 estados )
// #Checking = Para revisar si el Token es valido o no
// #authenticated para ver si el usuario esta autenticado o no
enum AuthStatus { checking, authenticated, notAuthenticated }

//Creamos nuestra clase AuthState
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

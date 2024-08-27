// Importaciones de Flutter necesarias para la implementación
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Importaciones de otras partes del proyecto
import 'package:teslo_shop_app/features/auth/presentation/providers/auth/auth_provider.dart';

// Definición de un provider usando Riverpod
// Este provider es responsable de crear y proporcionar una instancia de GoRouterNotifier
final goRouterNotifierProvider = Provider((ref) {
  // Se obtiene el AuthNotifier desde el authProvider mediante el método read
  final authNotifier = ref.read(authProvider.notifier);
  // Se retorna una nueva instancia de GoRouterNotifier, pasando el authNotifier como argumento
  return GoRouterNotifier(authNotifier);
});

// Definición de la clase GoRouterNotifier, que extiende de ChangeNotifier
// Esto significa que esta clase podrá notificar a sus oyentes cuando ocurra algún cambio
class GoRouterNotifier extends ChangeNotifier {
  // Propiedad privada de tipo AuthNotifier
  // Este es el objeto que maneja el estado de autenticación en la aplicación
  final AuthNotifier _authNotifier;

  // Propiedad privada que almacena el estado actual de autenticación
  AuthStatus _authStatus = AuthStatus.checking;

  // Constructor de la clase que recibe una instancia de AuthNotifier
  // Se suscribe a los cambios en AuthNotifier para actualizar el estado de autenticación
  GoRouterNotifier(this._authNotifier) {
    // Se agrega un listener (oyente) a _authNotifier
    // Cuando el estado de autenticación cambia, se actualiza authStatus en GoRouterNotifier
    _authNotifier.addListener((state) {
      authStatus = state.authStatus;
    });
  }

  // Getter para acceder al estado de autenticación actual
  AuthStatus get authStatus => _authStatus;

  // Setter para actualizar el estado de autenticación y notificar a los oyentes
  set authStatus(AuthStatus value) {
    // Se actualiza el valor de _authStatus con el nuevo valor
    _authStatus = value;
    // Se notifica a todos los oyentes que el estado ha cambiado
    notifyListeners();
  }
}

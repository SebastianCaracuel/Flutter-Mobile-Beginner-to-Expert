//? Este es un archivo de implementación de la interfaz KeyValueStorageServices

// Importaciones necesarias para usar SharedPreferences,
// que permite almacenar datos de manera persistente en el dispositivo.
import 'package:shared_preferences/shared_preferences.dart';

// Importación de la interfaz que vamos a implementar.
import 'key_value_storage_services.dart';

//? Esta clase implementa los métodos de la interfaz KeyValueStorageServices
//? usando SharedPreferences.
class KeyValueStorageServicesImpl extends KeyValueStorageService {
  //! MÉTODO PRIVADO
  //! Este método privado obtiene una instancia de SharedPreferences
  //! de manera asíncrona, que es necesaria para acceder al almacenamiento.
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  // Implementación del método para obtener un valor asociado a una clave.
  // Este método es genérico, lo que significa que puede devolver valores
  // de diferentes tipos (int, String, etc.).
  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();

    // Se usa un switch para determinar el tipo de dato que se debe recuperar.
    switch (T) {
      case const (int):
        // Si T es int, devuelve el valor almacenado como entero.
        return prefs.getInt(key) as T?;

      case const (String):
        // Si T es String, devuelve el valor almacenado como cadena.
        return prefs.getString(key) as T?;

      default:
        // Si se intenta obtener un tipo no soportado, se lanza un error.
        throw UnimplementedError(
            'GET not implemented for Type ${T.runtimeType}');
    }
  }

  // Implementación del método para eliminar una clave del almacenamiento.
  @override
  Future<bool> removeKey(String key) async {
    // Obtiene la instancia de SharedPreferences y elimina la clave.
    final prefs = await getSharedPrefs();
    return await prefs.remove(key);
  }

  // Implementación del método para establecer un valor asociado a una clave.
  // Este método es genérico, lo que significa que puede almacenar valores
  // de diferentes tipos (int, String, etc.).
  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    // Obtiene la instancia de SharedPreferences.
    final prefs = await getSharedPrefs();

    // Se usa un switch para determinar el tipo de dato que se debe almacenar.
    switch (T) {
      case const (int):
        // Si T es int, almacena el valor como entero.
        prefs.setInt(key, value as int);
        break;

      case const (String):
        // Si T es String, almacena el valor como cadena.
        prefs.setString(key, value as String);
        break;

      default:
        // Si se intenta almacenar un tipo no soportado, se lanza un error.
        throw UnimplementedError(
            'Set not implemented for Type ${T.runtimeType}');
    }
  }
}

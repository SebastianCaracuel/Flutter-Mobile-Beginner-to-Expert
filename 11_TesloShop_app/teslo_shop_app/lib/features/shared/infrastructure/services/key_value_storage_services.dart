//? Este es un archivo para un servicio de almacenamiento de datos basado en pares clave-valor

abstract class KeyValueStorageService {
  //? Este método es asíncrono y se utiliza para guardar un valor (value)
  //? asociado a una clave (key) en el almacenamiento.
  //? No devuelve nada (void).
  Future<void> setKeyValue<T>(String key, T value);

  //? Este método es asíncrono y se utiliza para obtener un valor almacenado
  //? asociado a una clave (key). Devuelve un Future que contiene el valor.
  //? El tipo de retorno debería ser especificado según la implementación.
  Future<T?> getValue<T>(String key);

  //? Este método es asíncrono y se utiliza para eliminar una clave (key)
  //? y su valor asociado del almacenamiento. Devuelve un Future<bool>
  //? que indica si la eliminación fue exitosa (true) o no (false).
  Future<bool> removeKey(String key);
}

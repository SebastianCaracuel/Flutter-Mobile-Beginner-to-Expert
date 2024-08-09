//? Este es un archivo de variables constantes

//Importaciones Flutter
import 'package:flutter_dotenv/flutter_dotenv.dart';

//Importaciones nuestras

//Creamos una variable llamada Environment
class Environment {
  //Propiedades

  //?Creamos una propiedad para traer a nuestro .env
  static initEnvironment() async {
    await dotenv.load(fileName: ".env");
  }

  //? Creamos una Propiedad estatica que trae una URL
  static String apiUrl =
      dotenv.env['API_URL'] ?? 'No está configgurado el API o la URL';
}

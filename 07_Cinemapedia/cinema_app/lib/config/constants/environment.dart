//Importaciones Flutter
import 'package:flutter_dotenv/flutter_dotenv.dart';

//Importaciones nuestas

//Creamos una clase

class Environment {
  //Propiedades
  static String movieDBKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'NOT FOUND API KEY';
}

//Importaciones flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Importaciones nuestras

// ? Crearemos un provider para la busqueda activa de nuestra aplicación

final searchQueryProvider = StateProvider<String>((ref) => '');

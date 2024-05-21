import 'package:flutter_riverpod/flutter_riverpod.dart';

//Creamos un estado para maneajar un bool (Modo oscuro app)

final isDarkModeProvider = StateProvider((ref) => false);

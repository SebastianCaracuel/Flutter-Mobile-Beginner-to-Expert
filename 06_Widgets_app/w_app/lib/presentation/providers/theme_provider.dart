import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:w_app/config/theme/app_theme.dart';

//?Creamos un estado para maneajar un bool (Modo oscuro app)
final isDarkModeProvider =
    StateProvider((ref) => false); //Referencia al modo oscuro

//?Creamos un estado para manejar nuestra lista de colores(ColorList)
final colorListProvider = Provider((ref) =>
    colorList); //Esta referencia es (Inmutable) que yo no lo puedo cambiar.

//?Cremaos un estado para manejar un entero
final selectedColorProvider = StateProvider((ref) => 0);//

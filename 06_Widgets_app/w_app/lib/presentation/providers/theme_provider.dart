import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:w_app/config/theme/app_theme.dart';

//?Creamos un estado para maneajar un bool (Modo oscuro app)
final isDarkModeProvider =
    StateProvider((ref) => false); //Referencia al modo oscuro

//?Creamos un estado para manejar nuestra lista de colores(ColorList)
final colorListProvider = Provider((ref) =>
    colorList); //Esta referencia es (Inmutable) que yo no lo puedo cambiar.

//?Cremaos un estado para manejar un entero
final selectedColorProvider = StateProvider((ref) => 0); //

//?Creamos un nuevo estado - objeto de tipo AppTheme personalizado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
); //

//Creamos una clase para el NotifierProvider
class ThemeNotifier extends StateNotifier<AppTheme> {
  //Controlador //?STATE = Estado = new AppTheme();
  ThemeNotifier()
      : super(
            AppTheme()); //Necesito que crees la primera instancia de mi apptheme con sus valores por defecto

  //todo :Creamos funciones vacias
  //
  //
  //? Función para el modo Oscuro
  void toggleDarkMode() {
    state = state.copyWith(isDarkmode: !state.isDarkMode);
  }

  //
  //
  //? Función para cambiar el color
  void changeColorIndex(int colorIndex) {}
}

//Importaciones Flutter
import 'package:flutter_riverpod/flutter_riverpod.dart';
//Importaciones nuestras
import 'package:cinema_app/config/theme/app_theme.dart';
//? Creamos un provider para implementar nuestro Dark Mode

//Creamos un método para manejar el modo oscuro de la aplicación.
final isDarkModeProvider = StateProvider((ref) => false);

//Creamos un nuevo estado - objeto de tipo AppTheme personalizado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Creamos una clase para el NotifierProvider
class ThemeNotifier extends StateNotifier<AppTheme> {
  //Controlador // ?STATE = Estado = New AppTheme();
  ThemeNotifier() : super(AppTheme());

  //Creamos una Función para el modo Oscuro
  void toggleDarkMode() {
    state = state.copyWith(isDarkmode: !state.isDarkMode);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:w_app/config/router/app_router.dart';
import 'package:w_app/config/theme/app_theme.dart';
import 'package:w_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
      //Llamamos a nuestro Gestor de estados - Riverpod
      const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  //Propiedades

  //Constructor
  const MainApp({super.key});

//Objeto
  @override
  Widget build(BuildContext context, ref) {
    //Propiedades del objeto
    //final isDarkMode = ref.watch(isDarkModeProvider);
    //final selectedColor = ref.watch(selectedColorProvider);

    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      //Router - config
      routerConfig: appRouter,
      //Colocamos nuestro tema o estilo
      theme: appTheme.getTheme(),
    );
  }
}

//Importaciones de Flutter
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

//Importaciones nuestras
import 'package:cinema_app/config/router/app_router.dart';
import 'package:cinema_app/config/theme/app_theme.dart';
import 'package:cinema_app/presentation/providers/providers.dart';

Future<void> main() async {
  //Splash Screen
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  //Definimos el paquete .env
  await dotenv.load(fileName: '.env');

  //Corremos la aplicación
  runApp(
      //Implementamos Riverpod - (ProviderScope) que tiene la referencia de todos nuestros providers
      const ProviderScope(
          //llamamos a la aplicación
          child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Propieades del Objeto

    //?Llamamos a nuestro método para que el dark mode funcione
    final isDarkmode = ref.watch(isDarkModeProvider);

    //Implementamos el router
    return MaterialApp.router(
      //?Dirección de la primera pantalla  - Home
      routerConfig: appRouter,

      //?Banner
      //debugShowCheckedModeBanner: false,

      //?Llamamos a nuestro tema de la aplicación e implementamos el Provider
      theme: AppTheme(isDarkMode: isDarkmode).getTheme(),
    );
  }
}

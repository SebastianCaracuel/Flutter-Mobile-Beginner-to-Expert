import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/router/app_router.dart';
import 'config/config.dart';

void main() async {
  //Añadimos nuestro assets en nuestro main
  await dotenv.load(fileName: ".env");
  runApp(
      //Esto es para inicializar el Provider (Riverpord)
      const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

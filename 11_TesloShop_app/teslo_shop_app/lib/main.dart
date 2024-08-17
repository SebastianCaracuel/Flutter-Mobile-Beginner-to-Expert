import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/config.dart';

void main() async {
  //Añadimos nuestro assets en nuestro main
  await Environment.initEnvironment();
  runApp(
      //Esto es para inicializar el Provider (Riverpord)
      const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print(Environment.apiUrl); //? Ver URL

    //Llamamos a la nueva ruta con el provider
    final appRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaciones nuestras
import 'package:push_notificaction_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Quitamos el banner debugShowCheckedModeBanner: false,
      //Colocamos el color de la aplicación
      theme: AppTheme().getTheme(),
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

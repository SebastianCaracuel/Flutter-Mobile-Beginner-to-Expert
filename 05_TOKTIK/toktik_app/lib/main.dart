import 'package:flutter/material.dart';
import 'package:toktik_app/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Quitamos el Banner de Debug
      debugShowCheckedModeBanner: true,

      //Importamos nuestro theme para la aplicación
      theme: AppTheme().getTheme(),

      //Titulo de la aplicación
      title: 'TOK TIK',

      //Scaffold
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TOK TIK'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:toktik_app/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Quitamos el Banner
      debugShowCheckedModeBanner: false,
      //Importamos el tema
      theme: AppTheme().getTheme(),
      title: 'TOK TIK',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

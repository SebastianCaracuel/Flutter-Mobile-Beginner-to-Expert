import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      //Quitamos el banner debug (Aplicación en desarrollo)
      debugShowCheckedModeBanner: false,
      //Importamos nuestro tema y aquí es donde podemos cambiar los colores de nuestra app
      theme: AppTheme(selectedColor: 0).theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: FilledButton.tonal(
              onPressed: () {}, child: const Text("click me")),
        ),
      ),
    );
  }
}

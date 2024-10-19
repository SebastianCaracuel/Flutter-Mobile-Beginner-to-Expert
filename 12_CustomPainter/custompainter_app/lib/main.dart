//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaiones Nuestras
import 'package:custompainter_app/src/pages/headers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HeadersPage(),
    );
  }
}

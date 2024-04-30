import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        //Esto es un banner que me da a entender que la app esta en modo desarrollador
        //Con esto quitamos este banner "Debug"
        debugShowCheckedModeBanner: false,
        //El Scaffold es una implementación de diseño basico de material.
        home: CounterScreen());
  }
}

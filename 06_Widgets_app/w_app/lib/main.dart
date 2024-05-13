import 'package:flutter/material.dart';
import 'package:w_app/config/theme/app_theme.dart';
import 'package:w_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Colocamos nuestro tema o estilo
      theme: AppTheme(selectedColor: 7).getTheme(),
      home: const HomeScreen(),
    );
  }
}

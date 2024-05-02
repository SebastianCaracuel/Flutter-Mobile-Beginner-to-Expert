import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
          title: 'Yes No App',
          //Quitamos el banner debug (Aplicación en desarrollo)
          debugShowCheckedModeBanner: false,
          //Importamos nuestro tema y aquí es donde podemos cambiar los colores de nuestra app
          theme: AppTheme(selectedColor: 2).theme(),
          home: const ChatScreen()),
    );
  }
}

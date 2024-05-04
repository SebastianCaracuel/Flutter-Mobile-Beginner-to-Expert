import 'package:flutter/material.dart';
import 'package:toktik_app/config/theme/app_theme.dart';
import 'package:toktik_app/presentation/screens/discover/discover_screen.dart';

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
        home: const DiscoverScreen());
  }
}

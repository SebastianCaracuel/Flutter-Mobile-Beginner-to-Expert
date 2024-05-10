import 'package:flutter/material.dart';

//Creamos un widget que será nuestro "Home"
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Discover Screen')),
    );
  }
}

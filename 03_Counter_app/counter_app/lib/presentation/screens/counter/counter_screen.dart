import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        //El mainAxisAligment se utiliza para controlar la alineación de los elementos
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('10'), Text('Cantidad de Clicks')],
      ),
    ));
  }
}

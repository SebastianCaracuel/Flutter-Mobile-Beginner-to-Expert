import 'package:flutter/material.dart';

//CLase
class CounterScreen extends StatelessWidget {
  //Propiedades
  static const name = 'provider_counter_screen';

  //Constructor
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter + Riverpod')),

      //cuerpo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Valor'),
            FilledButton(
                onPressed: () {}, child: const Icon(Icons.plus_one_rounded)),
          ],
        ),
      ),
    );
  }
}

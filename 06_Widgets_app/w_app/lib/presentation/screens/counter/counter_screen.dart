import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:w_app/presentation/providers/counter_provider.dart';

//Clase - Pasamos nuestro stateless a un ConsumerWidget - que nos ofrece el metodo build con nuestra referencia a Widget
class CounterScreen extends ConsumerWidget {
  //Propiedades
  static const name = 'provider_counter_screen';

  //Constructor
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Propiedades
    final int clickCounter = ref.watch(
        counterProvider); //todo: Realizamos la conexión con nuestro Provider Riverpod

    //Presentación
    return Scaffold(
      appBar: AppBar(title: const Text('Counter + Riverpod')),

      //cuerpo
      body: Center(
          child: Text('Value: $clickCounter',
              style: Theme.of(context).textTheme.titleLarge)),

      //Botón Plus
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //?Otra forma para cambiar el valor
            //?ref.read(counterProvider.notifier).update((state) => state + 1);

            //todo: Cambiar el valor
            ref //Llamamos a la referencia
                    .read //Leemos la referenci
                    (counterProvider.notifier) // Llamamos a nuestro counter
                    .state //El state va a ser un entero
                ++ //Transformamos el entero
                ;
          },
          child: const Icon(Icons.plus_one_rounded)),
    );
  }
}

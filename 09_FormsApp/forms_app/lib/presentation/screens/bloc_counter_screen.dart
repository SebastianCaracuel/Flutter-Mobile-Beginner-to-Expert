//? Este es la pantalla del Bloc - Esto será un Counter App

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//Importaciones nuestras
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

//Creación de la pantalla para la navegación
class BlocScreen extends StatelessWidget {
  //Propieades

  //Constructor
  const BlocScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades

    //!Widget Padre
    return BlocProvider(
        create: (_) => CounterBloc(), child: const _BlocCounterView());
  }
}

//Extraer el Widget para transformar el Widget a un Bloc
class _BlocCounterView extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const _BlocCounterView();

  //? Cramos un método para incrementar el número del contador
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBlocBloc>().add(CounterIncreased(value)); //?Cambio realizado en la clase Opcional
    context
        .read<CounterBloc>()
        .increaseBy(value); //Nueva función implementando el nuevo método
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //!Widget hijo
    return Scaffold(
      //Colocamos una barra superior
      appBar: AppBar(
        title: context.select(
          (CounterBloc bloc) => Center(
              child: Text('Bloc Transaction: ${bloc.state.transactionCount}')),
        ),
        actions: [
          //Coloamos un botón
          IconButton(
              //todo: Función
              onPressed: () => context.read<CounterBloc>().resetCounter(),
              //Icono
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      //Cuerpo
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Colocamos el texto del contador
          const Text('COUNTER VALUE',
              //Le agregamos un estilo
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800)),
          //todo : Número
          context.select(
            (CounterBloc counterBloc) => Text('${counterBloc.state.counter}',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.w300)),
          ),

          //Botónes
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Botón Sumar
                FloatingActionButton(
                  //
                  heroTag: '1',
                  //todo: Función
                  onPressed: () => increaseCounterBy(context),
                  child: const Text('+1'),
                ),

                //Botón Sumar
                FloatingActionButton(
                  //
                  heroTag: '2',
                  //todo: Función
                  onPressed: () => increaseCounterBy(context, 2),
                  child: const Text('+2'),
                ),

                //Botón Sumar
                FloatingActionButton(
                  //
                  heroTag: '3',
                  //todo: Función
                  onPressed: () => increaseCounterBy(context, 3),
                  child: const Text('+3'),
                ),
              ],
            ),
          ),

          //Botón Refresh
          FloatingActionButton(
            //
            heroTag: '4',
            //todo: Función
            onPressed: () => context.read<CounterBloc>().resetCounter(),
            child: const Icon(Icons.refresh_rounded),
          ),
        ],
      )),

      //Botón Flotante
    );
  }
}

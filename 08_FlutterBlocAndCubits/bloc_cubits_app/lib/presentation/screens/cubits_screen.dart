//? Este es la pantalla del Cubits - Esto será un Counter App

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Importaciones Nuestras
import 'package:bloc_cubits_app/presentation/blocs/counter_cubit/counter_cubit.dart';

//Creamos la clase para la pantalla de Cubits
class CubitsScreen extends StatelessWidget {
  //Propiedades de la clase

  //Constructor
  const CubitsScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del Objeto

    //!Widget Padre
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

//Se extrajo el Widget como vista
class _CubitCounterView extends StatelessWidget {
  //Propiedaeds

  //Constructor
  const _CubitCounterView();

  //?Creamos un método
  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propieades del Objeto

    //?
    // final counterState = context.watch<CounterCubit>().state;

    //!Widget Hijo
    return Scaffold(
      //Colocamos una barra superior
      appBar: AppBar(
        // El título del AppBar se construye utilizando el estado actual del CounterCubit
        title: context.select((CounterCubit value) {
          // Selecciona el estado actual de CounterCubit y devuelve un widget Text
          // que muestra el contador de transacciones
          return Center(
              child:
                  Text('Cubits Transaction: ${value.state.transactionCount}'));
        }),
        actions: [
          //Coloamos un botón
          IconButton(
              //todo: Función
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              //Icono
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      //Cuerpo
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //El texto donde estará el valor númerico
          BlocBuilder<CounterCubit, CounterState>(
            //buildWhen: (previous, current) => current.counter != previous.counter,
            builder: (context, state) {
              return Column(
                children: [
                  //Colocamos el texto del contador
                  const Text('COUNTER VALUE',
                      //Le agregamos un estilo
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w800)),
                  //todo : Número
                  Text('${state.counter}',
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.w300)),
                ],
              );
            },
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
                  onPressed: () => increaseCounterBy(context, 1),
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
            onPressed: () {
              //REsetamos el valor
              context.read<CounterCubit>().reset();
            },
            child: const Icon(Icons.refresh_rounded),
          ),
        ],
      )),

      //Botón Flotante
    );
  }
}

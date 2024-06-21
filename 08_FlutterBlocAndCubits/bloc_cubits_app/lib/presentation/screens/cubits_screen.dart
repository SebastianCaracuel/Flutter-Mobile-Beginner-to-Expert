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

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propieades del Objeto

    //?
    final counterState = context.watch<CounterCubit>().state;

    //!Widget Hijo
    return Scaffold(
      //Colocamos una barra superior
      appBar: AppBar(
        title: Center(
            child: Text('Cubits Counter: ${counterState.transactionCount}')),
        actions: [
          //Coloamos un botón
          IconButton(
              //todo: Función
              onPressed: () {},
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
              return Text('Counter Value: ${state.counter}');
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
                  onPressed: () {},
                  child: const Text('+1'),
                ),

                //Botón Sumar
                FloatingActionButton(
                  //
                  heroTag: '2',
                  //todo: Función
                  onPressed: () {},
                  child: const Text('+2'),
                ),

                //Botón Sumar
                FloatingActionButton(
                  //
                  heroTag: '3',
                  //todo: Función
                  onPressed: () {},
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
            onPressed: () {},
            child: const Icon(Icons.refresh_rounded),
          ),
        ],
      )),

      //Botón Flotante
    );
  }
}

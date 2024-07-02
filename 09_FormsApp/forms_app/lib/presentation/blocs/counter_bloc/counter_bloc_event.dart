part of 'counter_bloc.dart';

//? Counter event nos permite a nosotros poder decir que tipos de eventos mi bloc va a recivir

abstract class CounterBlocEvent {
  const CounterBlocEvent();
}

//Creamos un nuevo evento para incrementar el contador
class CounterIncreased extends CounterBlocEvent {
  //Si el counter incremento
  final int value;

  //Constructor con el valor
  const CounterIncreased(this.value);
}

//Creamos un nuevo evento para resetear el número del contador
class CounterRest extends CounterBlocEvent {}

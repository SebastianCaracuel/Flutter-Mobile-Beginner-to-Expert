part of 'counter_bloc_bloc.dart';

//? Counter event nos permite a nosotros poder decir que tipos de eventos mi bloc va a recivir

abstract class CounterBlocEvent {
  const CounterBlocEvent();
}

//Creamos un nuevo evento
class CounterIncreased extends CounterBlocEvent {
  //Si el counter incremento
  final int value;

  //Constructor con el valor
  const CounterIncreased(this.value);
}

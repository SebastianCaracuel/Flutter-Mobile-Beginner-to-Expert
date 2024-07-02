part of 'counter_bloc.dart';

class CounterBlocState extends Equatable {
  //Propiedades de la clase

  //?Creamos las propiedades
  final int counter;
  final int transactionCount;

  //Constructor
  const CounterBlocState({this.counter = 0, this.transactionCount = 0});

  //Creamos un CopyWith
  CounterBlocState copyWith({
    int? counter,
    int? transactionCount,
  }) =>
      CounterBlocState(
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount);

  //Esto es para que bloc pueda evuluar si el estado es igual al otro
  @override
  List<Object> get props => [counter, transactionCount];
}

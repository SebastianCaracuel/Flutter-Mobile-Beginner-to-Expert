import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

//?

//Clase counterBloc
class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  //Constructor que inicializa el estado
  CounterBlocBloc() : super(const CounterBlocState()) {
    //Mandamos la referencia de nuestro manjeador a la función
    //? Lo que permite esto es que nosotros podamos llamar varias funciones y qure se vea ordenado
    on<CounterIncreased>(_onCounterIncreased);
  }

  //Creamos un manejador
  void _onCounterIncreased(
      CounterIncreased event, Emitter<CounterBlocState> emit) {
    //Cuando el counter sea incrementado
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }
}

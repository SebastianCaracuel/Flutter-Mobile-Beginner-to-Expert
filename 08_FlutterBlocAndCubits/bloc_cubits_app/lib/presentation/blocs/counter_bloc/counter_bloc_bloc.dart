import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

//?

//Clase counterBloc
class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  //Constructor que inicializa el estado
  CounterBlocBloc() : super(const CounterBlocState()) {
    //El cuerpo del constructor

    on<CounterIncreased>((event, emit) {
      //Cuando el counter sea incrementado
      emit(state.copyWith(
          counter: state.counter + event.value,
          transactionCount: state.transactionCount + 1));
    });
  }
}

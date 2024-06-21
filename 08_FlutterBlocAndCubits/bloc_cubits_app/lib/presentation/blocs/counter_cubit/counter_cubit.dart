import 'package:flutter_bloc/flutter_bloc.dart'; // Importa el paquete flutter_bloc

part 'counter_state.dart'; // Indica que 'counter_state.dart' es parte de este archivo

// Define una clase CounterCubit que extiende Cubit con un tipo de estado CounterState
class CounterCubit extends Cubit<CounterState> {
  // Constructor de CounterCubit que llama al constructor de la superclase Cubit
  CounterCubit()
      : super(CounterState(
            counter:
                5)); // Inicializa el estado con CounterState donde counter es 5

  // Método para incrementar el valor del contador por un valor específico
  void increaseBy(int value) {
    emit(
      state.copyWith(
        counter: state.counter +
            value, // Incrementa el contador por el valor especificado
        transactionCount:
            state.transactionCount + 1, // Incrementa el conteo de transacciones
      ),
    );
  }

  // Método para reiniciar el contador a cero
  void reset() {
    emit(
      state.copyWith(
        counter: 0, // Reinicia el contador a 0
      ),
    );
  }
}

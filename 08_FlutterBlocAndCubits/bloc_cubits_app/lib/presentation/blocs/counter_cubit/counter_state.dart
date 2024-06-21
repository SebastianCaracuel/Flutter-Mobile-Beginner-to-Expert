part of 'counter_cubit.dart'; // Indica que este archivo es parte de 'counter_cubit.dart'

// Definimos una clase llamada CounterState
class CounterState {
  // Propiedades de la clase CounterState
  final int counter; // Propiedad para almacenar el valor del contador
  final int
      transactionCount; // Propiedad para almacenar el conteo de transacciones

  // Constructor de la clase CounterState con valores predeterminados
  CounterState({this.counter = 0, this.transactionCount = 0});

  // Método copyWith para crear una copia del estado actual con posibles cambios en las propiedades
  CounterState copyWith({
    int? counter, // Parámetro opcional para el valor del contador
    int? transactionCount, // Parámetro opcional para el conteo de transacciones
  }) =>
      // Retorna una nueva instancia de CounterState
      CounterState(
        counter: counter ??
            this.counter, // Si se proporciona un nuevo valor, úselo; de lo contrario, use el valor actual
        transactionCount: transactionCount ??
            this.transactionCount, // Si se proporciona un nuevo valor, úselo; de lo contrario, use el valor actual
      );
}

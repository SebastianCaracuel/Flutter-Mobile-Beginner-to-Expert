//Importaciones flutter
import 'package:flutter/material.dart';
//Importaciones nuestras

//Creamos una clase
class FullScreenLoader extends StatelessWidget {
  //Propiedades

  //?Creamos un Método para obtener mensajes de carga - una lista de textos
  Stream<String> getLoadingMessages() {
    //? Arreglo de mensajes de carga
    final messages = <String>[
      'Estamos calentando las palomitas de maíz para ti.',
      'Cargando películas en cines',
      'Cargando películas populares',
      'Cargando películas más vistas',
    ];
    // Retorno del Stream de mensajes
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  //Constructor
  const FullScreenLoader({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades del objeto

    //Widget padre
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Espacio superior
        const SizedBox(height: 10),
        // Indicador de progreso circular
        const Padding(
            padding: EdgeInsets.all(50),
            child: CircularProgressIndicator(strokeWidth: 4)),
        // Espacio inferior
        const SizedBox(height: 10),

        // StreamBuilder para mostrar mensajes de carga
        StreamBuilder(
          // Asignamos el flujo de mensajes al stream del StreamBuilder
          stream: getLoadingMessages(),
          // Definimos la función que construye el widget basado en el estado del flujo
          builder: (context, snapshot) {
            // Si el stream no tiene datos, muestra el título de la app
            if (!snapshot.hasData) return const Text('Cinemapedia');

            // Si el stream tiene datos, muestra el mensaje actual
            return Text(snapshot.data!);
          },
        ),
      ],
    ));
  }
}

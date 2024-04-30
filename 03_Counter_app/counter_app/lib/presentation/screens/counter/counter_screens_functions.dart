import 'package:flutter/material.dart';

class CounterFunctionscreen extends StatefulWidget {
  const CounterFunctionscreen({super.key});

  @override
  State<CounterFunctionscreen> createState() => _CounterFunctionscreenState();
}

class _CounterFunctionscreenState extends State<CounterFunctionscreen> {
  //Creamos una variable que es igual a 0
  int clickcounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creación de menu superior
      appBar: AppBar(
        title: const Center(child: Text("CONTADOR")),
      ),
      body: Center(
        child: Column(
          //El mainAxisAligment se utiliza para controlar la alineación de los elementos
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Colocamos la variable dentro de nuestro texto
            Text(
              '$clickcounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text('Click${clickcounter == 1 ? '' : 's'}',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700))
          ],
        ),
      ),
      //Creamos un Boton Flotante
      floatingActionButton: FloatingActionButton(
          //Creamos la función de incrementación al presionar el botón
          onPressed: () {
            //Le indicamos cuando queremos que se renderice nuestra pantalla
            //o cuando se renderice nuestro Widget.
            setState(() {
              clickcounter++;
            });
          },
          child: const Icon(Icons.plus_one)),
    );
  }
}

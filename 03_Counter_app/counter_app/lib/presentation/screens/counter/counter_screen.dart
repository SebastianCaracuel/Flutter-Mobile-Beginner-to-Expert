import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creación de menu superior
      appBar: AppBar(
        title: const Center(child: Text("CONTADOR")),
      ),
      body: const Center(
        child: Column(
          //El mainAxisAligment se utiliza para controlar la alineación de los elementos
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '10',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text('CANTIDAD DE CLICKS',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700))
          ],
        ),
      ),
      //Creamos un Boton Flotante
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.plus_one)),
    );
  }
}

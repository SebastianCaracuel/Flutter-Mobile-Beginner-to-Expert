import 'package:flutter/material.dart';

//todo: Cramos un listado para nuestras tarjetas

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

//Creamos ahora el screen de las tarjetas
class CardsScreen extends StatelessWidget {
  //Creamos la ruta estatica para el nombre de la screen
  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      //Colocamos el Widget para que no consuma mucho espacio
      body: const _CardsView(),
    );
  }
}

//Creamos le Widget de la vista de las cartas
class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) =>
              _CardType1(elevation: card['elevation'], label: card['label'])),
        ],
      ),
    );
  }
}

//Creamos un nuevo Widget que definiremos en nuestra columna
class _CardType1 extends StatelessWidget {
  //Creamos una propiedad
  final String label;
  final double elevation;

  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    //Llamamos al card un componente de flutter
    return Card(
      //a la elevación le pasamos nuestro propiedad elevation
      elevation: elevation,
      //child - colocamos un padding para hacer una separación
      child: Padding(
          //pading cofiguratipn
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),

          //COlocamos un unico hijo que es un scroll
          child: Column(
            children: [
              //Creamos un aligment para linear los componentes - alineamos arriba a la drecha
              Align(
                  alignment: Alignment.topRight,
                  //Creamos un icono con boton
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded))),
              //Creamos otro alignment ahora para nuestro texto - lo alineamos abajo a la izquierda
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label),
              )
            ],
          )),
    );
  }
}

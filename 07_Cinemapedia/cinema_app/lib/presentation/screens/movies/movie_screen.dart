//Importaciones Flutter
import 'package:flutter/material.dart';

//Importaciones nuestras

//Clase
class MovieScreen extends StatefulWidget {
  //Propiedades

  //Nombre de la pantalla
  static const name = 'movie-screen';

  //?Definimos como propiedad el Id de una película.
  final String movieId;

  //Constructor
  const MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

//State
class _MovieScreenState extends State<MovieScreen> {
  //State propiedades

//Cuando estoy cargando
  @override
  void initState() {
    super.initState();

    //
  }

//Cuando termine de cargar
  @override
  void dispose() {
    //

    super.dispose();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades objeto

    //Widget padre
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MovieID: ${widget.movieId}')),
      ),
    );
  }
}

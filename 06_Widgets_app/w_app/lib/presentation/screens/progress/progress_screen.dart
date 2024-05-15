import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Creamos nuestra Screen
class ProgressScreen extends StatelessWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'progress_screen';

  //Constructor
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creamos un appbar para ver el titulo de la pagina en la que estamos y para acceder al botón atras.
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),

      //Aquí tenemos nuestra pagina de Progress indicator
      body: const _ProgressView(),
    );
  }
}

//Creamos nuesta pagina del Progress indicators
class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 30),
          //Titulo de la screen
          Text('Circular Progress Indicator with a value'),

          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 30),

          //todo: Creamos nuestro progress indicator customizado con un Row
          _CircularProgressIndicator(),

          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 50),

          Text('Circular Progress Indicator infinite'),

          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 10),

          //Creamos el circular progress indicator que se carga de forma infinita
          CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.black12,
          ),

          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 50),

          Text('Linear Progress Indicator with value'),

          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 20),

          //todo: Creamos nuestro progress indicator customizado con un Row
          _LinearProgressIndicators(),

          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 50),

          Text('Circular Progress Indicator finite'),

          //Colocamos una separación en la parte superior para que nuestro widget no este tan pegado arriba
          SizedBox(height: 10),

          //todo: Creamos nuestro progress indicator customizado en stream
          _LinearProgressIndicatorBuilder(),
        ],
      ),
    );
  }
}

//? Widgets Customers

//Creamos un Widget con un Row de Circular Progress Indicator para que no sea extenso nuestro codigo
class _CircularProgressIndicator extends StatelessWidget {
  const _CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),

            //Primer
            child: CircularProgressIndicator(
                //Indicamos que la linea del circulo tenga un grosor de 2
                strokeWidth: 5,

                //Le agregamos un valor que indica que se encuentra en 3
                value: 0.3,
                //Le asignamos un background de color negro opaco.
                backgroundColor: Colors.black12)),

        //Creamos un circular progress indicator al 6 porcierto con value
        CircularProgressIndicator(
          //size del grosor del circulo
          strokeWidth: 5,
          value: 0.6,
          backgroundColor: Colors.black12,
        ),
        SizedBox(width: 20),

        //Creamos un circular progress indicator al 9 porcierto con value
        CircularProgressIndicator(
          //size del grosor del circulo
          strokeWidth: 5,
          value: 0.9,
          backgroundColor: Colors.black12,
        ),
        SizedBox(width: 20),

        //Creamos un circular progress indicator sin value
        CircularProgressIndicator(
          //size del grosor del circulo
          strokeWidth: 5,
          value: 1.0,
          backgroundColor: Colors.black12,
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

//Creamos un Widget con un row de Linear progress indicator para que no sea tan extenso nuesto codigo
class _LinearProgressIndicators extends StatelessWidget {
  const _LinearProgressIndicators();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      //Colocamos un padding
      padding: EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        children: [
          Expanded(
              //Primer Linear Progress Indicator with value 3
              child: LinearProgressIndicator(value: 0.3)),

          //Space
          SizedBox(width: 30),

          //Second liner progress with value 6
          Expanded(child: LinearProgressIndicator(value: 0.6)),

          //Space
          SizedBox(width: 30),

          //Third liner progrss with value 9
          Expanded(child: LinearProgressIndicator(value: 0.9)),
        ],
      ),
    );
  }
}

//Linear Progres indicator stream or finite
class _LinearProgressIndicatorBuilder extends StatelessWidget {
  const _LinearProgressIndicatorBuilder();

  @override
  Widget build(BuildContext context) {
    //Utilizamos StreamBuilder ya que nos permite construir de forma dinamica
    // la UI en función de los datos que fluyen a través de un flujo (Stream)
    return StreamBuilder(
      //En este caso le indicamos que queremos qu enuestro indicador sea periodico
      //Que se demore 300 milisegundos en cargar.
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        //El valor emitido es el resultado de multiplicar el valor actual por 2 y dividirlo en 100
        return (value * 2) / 100;
        // Usamos TakeWhile para asegurarnos de que el flujo se detenga cuando el valor emitido sea mayor o igual a 100.
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        //
        final progressValue = snapshot.data ?? 0;

        //Colocamos un padding para tenerlom más ordenado y bonito
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          //Nuestro progress indicator lineal
          child: LinearProgressIndicator(
            //Colocamos nuestro valor
            value: progressValue,
          ),
        );
      },
    );
  }
}

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
          //titulo de la barra
          title: const Center(child: Text("CONTADOR")),
          //Creamos un Botón en nuestro menu superior o Barra
          //?Si queremos que nuestro botón este a mano izq debemos colocar leading.
          actions: [
            //Le colocamos la función de refrescar al IconButton
            IconButton(
                onPressed: () {
                  setState(() {
                    //?Lo que hacemos aquí es que nuestra variable es igual a 0
                    //?Por lo que si dentro de nuestra variable hay un valor,
                    clickcounter = 0;
                  });
                },
                //Colocamos un Icono que sea relevante a lo que estamos programando
                icon: const Icon(Icons.refresh_rounded)),
          ],
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
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700))
            ],
          ),
        ),

        //Creamos un Boton Flotante
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                //!Cambiaremos el estilo del botón a circular
                shape: const StadiumBorder(),
                //Creamos la función de incrementación al presionar el botón
                onPressed: () {
                  //Le indicamos cuando queremos que se renderice nuestra pantalla
                  //o cuando se renderice nuestro Widget.
                  setState(() {
                    clickcounter++;
                  });
                },
                child: const Icon(Icons.plus_one)),
            //?Creamos un contenedor especifico para los espacios
            const SizedBox(
              height: 15,
            ),
            //Creamos otro Botón
            FloatingActionButton(
                //Creamos la función de disminuir al presionar el botón
                onPressed: () {
                  //Le indicamos cuando queremos que se renderice nuestra pantalla
                  //o cuando se renderice nuestro Widget.
                  //? Creamos un IF que nuestro contador no puede pasar de 0 es decir no tendrá números Negativos
                  if (clickcounter == 0) return;
                  setState(() {
                    clickcounter--;
                  });
                },
                child: const Icon(Icons.exposure_minus_1_outlined)),

            //?Creamos un contenedor especifico para los espacios
            const SizedBox(
              height: 15,
            ),

            //Creamos otro Botón
            const CustomButton(
              icon: Icons.refresh_outlined,
            ),
          ],
        ));
  }
}

//?Creamos un Widget Personalizable para nuestro Botón
class CustomButton extends StatelessWidget {
  //Colocamos las varibles que queremos dentro de nuestro Widgets
  final IconData icon;

  const CustomButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        //Creamos la función de reiniciar al presionar el botón
        onPressed: () {
          //Le indicamos cuando queremos que se renderice nuestra pantalla
          //o cuando se renderice nuestro Widget.
        },
        child: Icon(icon));
  }
}

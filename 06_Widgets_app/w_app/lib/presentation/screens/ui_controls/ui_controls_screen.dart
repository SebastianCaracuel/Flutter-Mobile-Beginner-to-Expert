import 'package:flutter/material.dart';

//Creamos nuestra Screen
class UicontrolsScreen extends StatelessWidget {
  //Creamos la variable para el nombre de la pantalla
  static const name = 'uicontrols_screen';

  //Constructor
  const UicontrolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Creamos el menu
      appBar: AppBar(
        //Titulo del menu
        title: const Text('UI Controls'),
      ),

      //Cuerpo de nuestro scaffold
      body: const _UiControlsView(),
    );
  }
}

//Sacamos nuestro widget para no hacer tan extendo el codigo
class _UiControlsView extends StatefulWidget {
  //Constructor
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

//Creamos una enúmeración para que nos permita determinar que valores son permitidios en nuestro //?RadioListTile

enum Transportation {
  car,
  plane,
  boat,
  submarine
} //Las enumeraciones no terminan con punto y coma.

//Clase
class _UiControlsViewState extends State<_UiControlsView> {
  //Propiedades del stateful
  bool isSwiftDeveloper =
      false; //?Esta propiedad es para "activar" el valor del switch developer
  bool isFlutterDeveloper =
      true; //?Esta propiedad es la por defecto de nuestro Switch

  Transportation selectedTransportation = Transportation
      .car; //?El valor por defecto de esta propiedad será { car } de nuestra enúmeración

  //¿Quiere tomar desayuno - almuerzo - cena? - Propiedades
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

//Función
  @override
  Widget build(BuildContext context) {
    //Creamos un ListView
    return ListView(
      //Evitamos el movimiento de rebote
      physics: const ClampingScrollPhysics(),
      children: [
        //Creamos un espacio
        const SizedBox(height: 20),
        //Creamos un Titulo
        const Center(
            child: Text('Switch Controls', style: TextStyle(fontSize: 20))),
        const SizedBox(height: 20),
        //todo:Cremaos un SwitchListTitel
        SwitchListTile(
            //Colocamos la propiedad que asignamos
            value: isSwiftDeveloper,
            //Le asignamos un titulo
            title: const Text('Swift Developer Mode'),
            //Asignamos un subtitlo
            subtitle: const Text('Aditional Controllers'),
            //Creamos un metodo con el que podamos cambiar el estado del Switch
            onChanged: (value) => setState(() {
                  isSwiftDeveloper = !isSwiftDeveloper;
                })),
        SwitchListTile(
            //Colocamos la propiedad que asignamos
            value: isFlutterDeveloper,
            //Le asignamos un titulo
            title: const Text('Flutter Developer Mode'),
            //Asignamos un subtitlo
            subtitle: const Text('Aditional Controllers'),
            //Creamos un metodo con el que podamos cambiar el estado del Switch
            onChanged: (value) => setState(() {
                  isFlutterDeveloper = !isFlutterDeveloper;
                })),

        //Creamos un espacio
        const SizedBox(height: 20),
        //Creamos un Titulo
        const Center(
            child: Text('List Radio Controls', style: TextStyle(fontSize: 20))),
        const SizedBox(height: 20),

        //todo: Utilizamos un ExpansionTitle - Que nos permite tener nuestro RadioListTitle y esconder los checkbox
        ExpansionTile(
          //Le asignamos un titulo
          title: const Text('Transportation Vehicle'),
          //Le asignamos un subtitulo
          subtitle: Text('$selectedTransportation'),
          children: [
            //todo: Creamos el RadioLisTitle - crearemos 4 y esto lo metemos dentro de un ExpansionTitle

            //?Primero
            RadioListTile(
                //La función del RadioListTilte es como un check que puede ser seleccionado uno solo.
                //Llamamos a nuestra propiedad que fue asignada con un valor por defecto.
                value: Transportation.car,
                //Le asignamos un titulo
                title: const Text('By Car'),
                //Un subtitulo
                subtitle: const Text('Traveling by car'),
                //es una variable que nosostros vamos a utilizar para marcar cual es la opción seleccionada
                groupValue: selectedTransportation,
                //Llamamos al valor y utilizamos el setState para llamar al UI cuando suceda un cambio
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),

            //?Segundo
            RadioListTile(
                //La función del RadioListTilte es como un check que puede ser seleccionado uno solo.
                //Llamamos a nuestra propiedad que fue asignada con un valor por defecto.
                value: Transportation.boat,
                //Le asignamos un titulo
                title: const Text('By Bout'),
                //Un subtitulo
                subtitle: const Text('Traveling by bout'),
                //es una variable que nosostros vamos a utilizar para marcar cual es la opción seleccionada
                groupValue: selectedTransportation,
                //Llamamos al valor y utilizamos el setState para llamar al UI cuando suceda un cambio
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),

            //?Tercero
            RadioListTile(
                //La función del RadioListTilte es como un check que puede ser seleccionado uno solo.
                //Llamamos a nuestra propiedad que fue asignada con un valor por defecto.
                value: Transportation.plane,
                //Le asignamos un titulo
                title: const Text('By Plane'),
                //Un subtitulo
                subtitle: const Text('Traveling by plane'),
                //es una variable que nosostros vamos a utilizar para marcar cual es la opción seleccionada
                groupValue: selectedTransportation,
                //Llamamos al valor y utilizamos el setState para llamar al UI cuando suceda un cambio
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    })),

            //?Cuarto
            RadioListTile(
                //La función del RadioListTilte es como un check que puede ser seleccionado uno solo.
                //Llamamos a nuestra propiedad que fue asignada con un valor por defecto.
                value: Transportation.submarine,
                //Le asignamos un titulo
                title: const Text('By Submarine'),
                //Un subtitulo
                subtitle: const Text('Traveling by submarine'),
                //es una variable que nosostros vamos a utilizar para marcar cual es la opción seleccionada
                groupValue: selectedTransportation,
                //Llamamos al valor y utilizamos el setState para llamar al UI cuando suceda un cambio
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    })),
          ],
        ),

        //Creamos un espacio
        const SizedBox(height: 20),
        //Creamos un Titulo
        const Center(
            child: Text('CheckBox Controls', style: TextStyle(fontSize: 20))),
        const SizedBox(height: 20),

        //todo: Creamos un CheckListBoxTitle - Nos permite hacer un check - Creamos 3 de estos

        //?Primero
        CheckboxListTile(
            //Llamamos a la variable
            value: wantsBreakfast,
            //Le agregamos un titulo
            title: const Text('Do you want Breakfast?'),
            //Creamos el metodo para
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),

        //?Segundo
        CheckboxListTile(
            //Llamamos a la variable
            value: wantsLunch,
            //Le agregamos un titulo
            title: const Text('Do you want Lunch?'),
            //Creamos el metodo para
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),

        //?Tercero
        CheckboxListTile(
            //Llamamos a la variable
            value: wantsDinner,
            //Le agregamos un titulo
            title: const Text('Do you want Dinner?'),
            //Creamos el metodo para
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}

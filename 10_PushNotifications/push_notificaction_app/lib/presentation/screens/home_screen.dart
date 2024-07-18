//? Este es el archivo de la pantalla incial

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//Importaciones Nuestras
import 'package:push_notificaction_app/presentation/blocs/notifications/notifications_bloc.dart';

//Creamos la clase que será nuestra pantalla inicial con sus respectivos Widgets
class HomeScreen extends StatelessWidget {
  //Propieades de la clase

  //Constructor de la clase
  const HomeScreen({super.key});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propieades del Objeto

    //!Widget Padre
    return Scaffold(
      //Creamos una barra superior
      appBar: AppBar(
        //Le añadimos un texto como titulo
        title: const Text('Permisos'),

        //Creamos unos botones
        actions: [
          IconButton(
              onPressed: () {
                //todo: solicitar permiso de notificaciones
                context.read<NotificationsBloc>().requestPermission();
              },
              icon: const Icon(Icons.settings)),
        ],
      ),

      body: const _HomeView(),
    );
  }
}

//Creamos un Widget privado para mantener nuestro Widget principal
class _HomeView extends StatelessWidget {
  //Propieades

  //Constructor
  const _HomeView();

//Objeto
  @override
  Widget build(BuildContext context) {
    //Propieades del Objeto

    //!Widget hijo
    return ListView(
      //Le añadimos un padding
      padding: const EdgeInsets.all(8),
      children: [
        //Añadimos un texto, para ver el status de la autorización
        context.select((NotificationsBloc bloc) =>
            Center(child: Text('${bloc.state.status}'))),
      ],
    );
  }
}

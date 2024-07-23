//? Este es el archivo de la pantalla incial

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Permisos'),
            context.select((NotificationsBloc bloc) => Text(
                  '${bloc.state.status}',
                  style: const TextStyle(fontSize: 15),
                )),
          ],
        ),
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

    //Llamamos nuestra Bloc con las notificaciones
    final notifications =
        context.watch<NotificationsBloc>().state.notifications;

    //!Widget hijo
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext context, int index) {
        // ? Notificaciones - Esta es la notificación
        final notification = notifications[index];
        return ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.body),
          leading: notification.imageUrl != null
              ? Image.network(notification.imageUrl!)
              : null,

          //todo: Cuando alguíen presione la notificación lo llevará a la pantalla de detalles
          onTap: () {
            context.push('/push-details/${notification.messageId}');
          },
        );
      },
    );
  }
}

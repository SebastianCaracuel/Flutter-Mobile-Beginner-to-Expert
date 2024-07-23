//? Esta es un archivo de la pantalla que nos dará los detalles de la notificación

//Importaciones Flutter
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Importaciones nuestras
import 'package:push_notificaction_app/domain/entities/push_message.dart';
import 'package:push_notificaction_app/presentation/blocs/notifications/notifications_bloc.dart';

//Creamos la clase de la pantalla
class DetailScreen extends StatelessWidget {
  //Propieades de la clase

  // ? Creamos una variable de PushMessageId para nosotros poder ingresar a la pantalla del mensaje correspondiente
  final String pushMessageId;

  //Constructor
  const DetailScreen({super.key, required this.pushMessageId});

  //Objeto
  @override
  Widget build(BuildContext context) {
    //Propieades del Objeto

    //Realizamos una evualiación
    final PushMessage? message =
        context.watch<NotificationsBloc>().getMessageById(pushMessageId);

    //!Widget Padre
    return Scaffold(
        //Barra superior
        appBar: AppBar(title: const Text('Detalles del Mensaje')),

        //Cuerpo
        body: (message != null)
            //Si el mensaje existe, mandamos la pantalla de detalles mostrando el mensaje
            ? _DetailsView(message: message)
            //Si el mensaje no existe
            : const Center(child: Text('Notificación no existe')));
  }
}

//Creamos un nuevo Widget para que no utilice toda la pantalla
class _DetailsView extends StatelessWidget {
  //Propieades

  // ? Llamamos al mensaje
  final PushMessage message;

  //Constructor
  const _DetailsView({required this.message});

//Objeto
  @override
  Widget build(BuildContext context) {
    //Propiedades Objeto

    // ? Creamos una propieades para nuestro texto
    final textStyle = Theme.of(context).textTheme;

    //!Widget hijo
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          //mostramos la imagen del Mensaje
          if (message.imageUrl != null) Image.network(message.imageUrl!),

          //Espacio Vacio
          const SizedBox(height: 30),

          //Llamamos al titulo del mensaje
          Text(message.title, style: textStyle.titleMedium),
          //Llamamos al cuerpo del mensaje
          Text(message.body),

          //Colocamos una división
          const Divider(),

          //Colocamos la data del mensaje
          Text(message.data.toString()),
        ],
      ),
    );
  }
}

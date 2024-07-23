//Importaciones Flutter
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Importaciones nuestras
import 'package:push_notificaction_app/config/theme/app_theme.dart';
import 'package:push_notificaction_app/config/router/app_router.dart';
import 'package:push_notificaction_app/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {
  //Inicialiazmos Firebase
  WidgetsFlutterBinding.ensureInitialized();
  //Configuración de Firebase
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFirebaseNotifications();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NotificationsBloc())],
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //Configuramos el router
      routerConfig: appRouter,

      //Quitamos el banner debugShowCheckedModeBanner: false,
      //Colocamos el color de la aplicación
      theme: AppTheme().getTheme(),
      builder: (context, child) =>
          HandleNotificationInteractions(child: child!),
    );
  }
}

// ? Creamos un nuevo Widget independiente para mejorar la interacción con las notificaciones
// Lo que nos permitirá, al momento de que llegué la notificación, navegar inmediatamente a la pantalla de detellas
class HandleNotificationInteractions extends StatefulWidget {
  //Propieades

  //?
  final Widget child;

  const HandleNotificationInteractions({super.key, required this.child});

  @override
  State<HandleNotificationInteractions> createState() =>
      _HandleNotificationInteractionsState();
}

class _HandleNotificationInteractionsState
    extends State<HandleNotificationInteractions> {
  //Propieades

  // Se asume que todos los mensajes contienen un campo de datos con la clave 'type'
  Future<void> setupInteractedMessage() async {
    // Obtener cualquier mensaje que haya causado la apertura de la aplicación desde
    // un estado terminado.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // Si el mensaje también contiene una propiedad de datos con un "tipo" de "chat",
    // navegar a una pantalla de chat
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // También manejar cualquier interacción cuando la aplicación está en segundo plano a través de un
    // oyente de Stream
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    //Cuando yo toco la notificación voy a almacenarla en mi Bloc
    context.read<NotificationsBloc>().handleRemoteMessage(message);

    //? Creamos una variable para Obtener el Id
    final messageId =
        message.messageId?.replaceAll(':', '').replaceAll('%', '');

    //Cuando yo recibo una notificación push, quiero navegar a ella con el ID
    appRouter.push('/push-details/$messageId');
  }

  @override
  void initState() {
    super.initState();

    // Ejecutar el código necesario para manejar mensajes interactuados en una función async
    // ya que initState() no debe ser async
    setupInteractedMessage();
  }

  //Objeto
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

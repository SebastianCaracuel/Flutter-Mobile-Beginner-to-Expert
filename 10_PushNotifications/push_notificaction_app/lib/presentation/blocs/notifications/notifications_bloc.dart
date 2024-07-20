//Importaciones Flutter
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//Importaciones nuestras
import 'package:push_notificaction_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  //Propiedades del bLoC

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  NotificationsBloc() : super(const NotificationsState()) {
    //Mandamos como referencia el método
    on<NotificationStatusChanged>(_notificationStatusChanged);

    //Llamamos al método de inicialización del Status
    _initialStatusCheck();
  }

  //todo: Creamos un nuevo método que nos díra si cambio o no el estado de autorización
  void _notificationStatusChanged(
      NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    //Llamamos la notificación
    emit(state.copyWith(status: event.status));
    //Llamamos el método que obtiene el token
    _getFirebaseToken();
  }

  //todo: creamos  un nuevo método, llamamos al método antes de que se inicie el LIstener
  void _initialStatusCheck() async {
    //Creamos una variable para los settings - para saber el estado actual.
    final settings = await messaging.getNotificationSettings();
    //Llamamos el nuevo evento con el settings notificaction
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  //todo: Obtener el Token del dispositivo
  void _getFirebaseToken() async {
    //Para ver el token del dispositivo solo lo podemos identificar con la autorización
    if (state.status != AuthorizationStatus.authorized) return;

    //Llamamos al Token y le asignamos una variable
    final token = await messaging.getToken();
    //Vemos si llama el token
    print(token);
  }

//todo :Creamos un método para los permisos
  void requestPermission() async {
    //?
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    //Añadimos la notificación
    add(NotificationStatusChanged(
        //Autorización
        settings.authorizationStatus));
  }

  //todo: Creamos un método estatico para nuestro Firebase
  static Future<void> initializeFirebaseNotifications() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}

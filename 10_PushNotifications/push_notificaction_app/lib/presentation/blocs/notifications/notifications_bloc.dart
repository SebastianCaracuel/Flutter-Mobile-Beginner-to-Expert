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

  //
  NotificationsBloc() : super(const NotificationsState()) {
    //Mandamos como referencia el método
    on<NotificationStatusChanged>(_notificationStatusChanged);
  }

  //? Creamos un nuevo método que nos díra si cambio o no el estado de autorización
  void _notificationStatusChanged(
      NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    //Llamamos la notificación
    emit(state.copyWith(status: event.status));
  }

//todo :Creamos un método para los permisos
  void requestPermission() async {
    //?
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    //
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

//importaciones Flutter
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//Importaciones nuestras

Future<void> requestPermissionLocalNotifications() async {
  //Creamos una variable
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
}

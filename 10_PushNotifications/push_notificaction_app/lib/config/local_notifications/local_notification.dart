//Importacion flutter
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//Creamos una clase para las notificaciones locales
class LocalNotifications {
  //todo: Método para tener los permisos de las notificaciones locales
  static Future<void> requestPermissionLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  //Cramos un nuevo //todo Método para inicializar las notificaciones
  static Future<void> initializeLocalNotifications() async {
    //Creamos una variable
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    //todo: Creamos una variable para ver o cambiar el icono de la Notificacion
    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    //IOS configuration

    //todo: creamos una variable para la inicialización de las configuraciónes de android
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    //
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      //TODO
      //onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse
    );
  }

  //todo: creamos un nuevo método que es la configuración y data de la Notificación - titulo - sonidos - cuerpo - etc
  static void showLocalNotification({
    //El Id de la notificacion local
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
    //Creamos una variable de Detalles de la notificación de Android
    const androidDetails = AndroidNotificationDetails(
      'channelId', 'channelName',

      //? Queremos que la Notificación tenga sonido
      playSound: true,
      //Llamamos a ese sonido
      sound: RawResourceAndroidNotificationSound('notification'),
      //Importacia del Mensaje
      importance: Importance.max,
      //Prioridad del mensaje - ¿Cual es la prioridad del mensaje?
      priority: Priority.high,
    );

    //Creamos una variable de los detalles de la notificación
    const notificationDetails = NotificationDetails(
      //configuración de android
      android: androidDetails,
    );

    //Esta variable es para pedir permisos
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    //
    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails,
        payload: data);
  }
}

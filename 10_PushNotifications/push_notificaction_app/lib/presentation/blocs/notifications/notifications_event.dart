part of 'notifications_bloc.dart';

abstract class NotificationsEvent {
  const NotificationsEvent();
}

//Creamos una nueva clase que nos traerá el nuevo status de la autorización
class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;

  const NotificationStatusChanged(this.status);
}

//todo: Crear un nuevo envento llamado NotificationReceived, recibimos un argunmento que es de tipo PushMessage
class NotificationRecived extends NotificationsEvent {
  final PushMessage pushMessage;

  NotificationRecived(this.pushMessage);
}

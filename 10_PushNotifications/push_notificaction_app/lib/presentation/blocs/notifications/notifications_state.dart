part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  //Propieades de la clase

  //? Creamos una variable que llama al paquete Firebase_messages
  final AuthorizationStatus status;

  //Creamos una lista
  //todo: Terminar la lista - Crear mi modelo de notificaiones
  final List<PushMessage> notifications;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined,
    this.notifications = const [],
  });

//? Creamos un CopyWith de la clase
  NotificationsState copyWith({
    AuthorizationStatus? status,
    List<PushMessage>? notifications,
  }) =>
      NotificationsState(
        status: status ?? this.status,
        notifications: notifications ?? this.notifications,
      );

  @override
  List<Object> get props => [status, notifications];
}

final class NotificationsInitial extends NotificationsState {}

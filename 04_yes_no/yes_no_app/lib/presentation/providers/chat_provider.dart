import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//Creamos una clase
class ChatProvider extends ChangeNotifier {
  //Creamos una lista de mensajes
  List<Message> message = [
    //Creamos un mensaje
    Message(
        text: '¿Que tal Miles?, ¿Como va todo por Brooklyn?',
        fromWho: FromWho.me),
    //Creamos otro mensaje
    Message(text: '¿Como esta tu tío?', fromWho: FromWho.me)
  ];

  //Metodos
  Future<void> sendMessage(String text) async {
    //Todo: La idea es que cuando yo envio y escribo un mensaje aquí, lo debo recibir.
  }
}

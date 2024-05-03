import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

//Creamos una clase
class ChatProvider extends ChangeNotifier {
  //Creamos una instancia de controll del chat
  final ScrollController chatScrollController = ScrollController();
  //Instancia de la clase de MilesMessage
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  //Creamos una lista de mensajes
  List<Message> messageList = [
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

    //Condición de si el mensaje esta vacio
    if (text.isEmpty) return;
    //Metodo
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    //Condición de la "?"
    if (text.endsWith('?')) {
      milesReply();
    }
    //
    notifyListeners();
    moveScrollToBottom();
  }

  //Creamos un nuevo metodo (para las respuestas Answer Yes No)
  Future<void> milesReply() async {
    final milesMessage = await getYesNoAnswer.getAnswer();
    messageList.add(milesMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  //Creamos una nueva función donde no vamos a generar nada
  Future<void> moveScrollToBottom() async {
    //Hacemos que esperemos una milesima de segundo para que se envie el mensaje
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}

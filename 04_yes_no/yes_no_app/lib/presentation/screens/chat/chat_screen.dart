import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/miles_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Creamos un Avatar circular
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIP.mSbqR1SvIcywqzbh8VALSwHaHa?rs=1&pid=ImgDetMain'),
          ),
        ),
        //Titulo del mensaje
        title: const Text("Miles Morales 🕷️"),
      ),

      //Cuerpo
      body: const _ChatView(),
    );
  }
}

//Creamos el Widget de Forma privada para que solo este aquí y no en otra screen
class _ChatView extends StatelessWidget {
  const _ChatView();
  @override
  Widget build(BuildContext context) {
    //Hacemos referencia a nuestro provider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //Usamos un WIdget Expanded ( PERMITE expandir el widget hijo a todo el espacio disponible que el padre le de)
            Expanded(
                //Hijo
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.miles)
                    ? const MilesMessageBubble()
                    : MyMessageBubble(message: message);
              },
            )),

            //Caja de Mensaje (Teclado)
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
    );
  }
}

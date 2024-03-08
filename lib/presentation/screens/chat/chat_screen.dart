import 'package:flutter/material.dart';
import 'package:message_application/domain/entities/message.dart';
import 'package:message_application/presentation/providers/chat_provider.dart';
import 'package:message_application/presentation/widgets/chat/her_message_bubble.dart';
import 'package:message_application/presentation/widgets/chat/my_message_bubble.dart';
import 'package:message_application/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://image.europafm.com/clipping/cmsimages01/2022/04/20/4250ABAA-45EB-42D7-92E3-E306D658B7D5/sydney-sweeney_98.jpg?crop=3000,1688,x0,y228&width=1900&height=1069&optimize=low&format=webply',
            ),
          ),
        ),
        title: const Text(
          'Sydney',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                //flutter va a ejutar para construir los widgets que van a entrar en la pantalla
                itemBuilder: ((context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(
                          message: message,
                        );
                }),
              ),
            ),

            /// caja de texti de mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}

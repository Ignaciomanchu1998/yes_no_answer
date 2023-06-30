import 'package:chat/config/shared/message_field_box.dart';
import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/chat_provider.dart';
import '../../widgets/her_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/564x/ae/ff/d5/aeffd50189e3058ab2382a85e0deff89.jpg',
            ),
          ),
        ),
        title: const Text('Nezuko'),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, i) {
                  final message = chatProvider.messageList[i];

                  return message.fromWho == FromWho.me
                      ? MessageBubbleWidget(
                          message: message,
                        )
                      : HerMessageBubbleWidget(
                          message: message,
                          imageUrl: message.imageUrl!,
                        );
                },
              ),
            ),
            MessageFieldBoxWidget(
              onSubmitted: chatProvider.sendMessage,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

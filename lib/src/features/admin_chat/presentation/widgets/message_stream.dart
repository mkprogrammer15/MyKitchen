import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profi_neon/src/features/admin_auth/data/data_sources/auth_data_source.dart';
import 'package:profi_neon/src/features/admin_chat/data/chat_helpers.dart';
import 'package:profi_neon/src/features/admin_chat/presentation/widgets/message_bubble.dart';

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ChatHelpers.messages,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<Widget> messageBubbles = <MessageBubble>[];
        for (final message in messages) {
          final messageText = message['text'].toString();
          final messageSender = message['sender'].toString();

          final currentUser =
              AuthDataSource().auth.currentUser!.email!.substring(0, 5);

          final messageBubble = MessageBubble(
            sender: messageSender.toString(),
            text: messageText,
            isMe: currentUser == messageSender,
          );

          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

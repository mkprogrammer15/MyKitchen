import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:profi_neon/src/core/data/data_source/data_source.dart';
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
        // ignore: prefer_final_locals
        List<Widget> messageBubbles = <MessageBubble>[];
        for (final message in messages) {
          final messageText = message['text'].toString();
          final messageSender = message['sender'].toString();
          final time = message['time'].toString();

          final currentUser =
              AuthDataSource().auth.currentUser!.email!.toString();

          final messageBubble = MessageBubble(
            time: time,
            sender: messageSender,
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

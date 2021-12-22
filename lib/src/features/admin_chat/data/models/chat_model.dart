import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profi_neon/src/features/admin_chat/domain/chat_entity.dart';

class ChatModel extends ChatEntity {
  ChatModel({
    required String message,
    required String userName,
  }) : super(message: message, userName: userName);

  factory ChatModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    final chatModel = ChatModel(
      message: snap['text'] as String,
      userName: snap['sender'] as String,
    );
    return chatModel;
  }
}

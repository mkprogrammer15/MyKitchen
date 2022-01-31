import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:profi_neon/src/features/admin_chat/data/models/chat_model.dart';
import 'package:profi_neon/src/features/admin_chat/domain/chat_entity.dart';

mixin ChatHelpers {
  static final _firebaseFirestore = FirebaseFirestore.instance;
  //static final formattedDate =
  //  DateFormat('dd-MM-yyyy kk:mm:ss:ms').format(currentDate).toString();
  static Future saveChatData(String messageText, String currentUser) async {
    await _firebaseFirestore.collection('messages').add(<String, dynamic>{
      'text': messageText,
      'sender': currentUser,
      'time': Timestamp.fromDate(DateTime.now()).toDate(),
    });
  }

  // static Future<List<ChatEntity>> getChatMessages() async {
  //   final qn = await _firebaseFirestore
  //       .collection('messages')
  //       .orderBy(
  //         'time',
  //       )
  //       .get();
  //   final data = qn.docs;
  //   final messages = <ChatEntity>[];
  //   for (final item in data) {
  //     final message = ChatModel.fromSnapshot(item);
  //     messages.add(message);
  //   }
  //   return messages;
  // }

  static Stream<QuerySnapshot> get messages {
    return _firebaseFirestore
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }
}

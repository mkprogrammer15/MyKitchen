import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatEntity {
  String message;
  String userName;
  DateTime time;

  ChatEntity({
    required this.message,
    required this.userName,
    required this.time,
  });
}

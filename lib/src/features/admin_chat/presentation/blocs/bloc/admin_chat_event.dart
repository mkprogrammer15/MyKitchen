part of 'admin_chat_bloc.dart';

abstract class AdminChatEvent extends Equatable {
  const AdminChatEvent();

  @override
  List<Object> get props => [];
}

class MessageEvent extends AdminChatEvent {
  final String message;
  final String userEmail;
  const MessageEvent({
    required this.message,
    required this.userEmail,
  });
  @override
  List<Object> get props => [message, userEmail];
}

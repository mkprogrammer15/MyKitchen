part of 'admin_chat_bloc.dart';

abstract class AdminChatState extends Equatable {
  const AdminChatState();

  @override
  List<Object> get props => [];
}

class AdminChatInitial extends AdminChatState {}

class MessageState extends AdminChatState {
  final List<ChatEntity> chatData;

  const MessageState({required this.chatData});

  @override
  List<Object> get props => [chatData];
}

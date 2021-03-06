import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:profi_neon/src/core/data/data_source/auth_data_source.dart';
import 'package:profi_neon/src/features/admin_chat/data/chat_helpers.dart';
import 'package:profi_neon/src/features/admin_chat/domain/chat_entity.dart';

part 'admin_chat_event.dart';
part 'admin_chat_state.dart';

class AdminChatBloc extends Bloc<AdminChatEvent, AdminChatState> {
  final auth = AuthDataSource();

  AdminChatBloc() : super(AdminChatInitial());

  @override
  Stream<AdminChatState> mapEventToState(
    AdminChatEvent event,
  ) async* {
    if (event is MessageEvent) {
      await ChatHelpers.saveChatData(event.message, event.userEmail);
      yield MessageState();
    }
  }
}

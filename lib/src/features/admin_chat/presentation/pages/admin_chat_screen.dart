import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profi_neon/src/core/data/data_source/data_source.dart';
import 'package:profi_neon/src/core/style/style_constants.dart';
import 'package:profi_neon/src/features/admin_auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:profi_neon/src/features/admin_chat/presentation/blocs/bloc/admin_chat_bloc.dart';
import 'package:profi_neon/src/features/admin_chat/presentation/widgets/message_stream.dart';

class AdminChatScreen extends StatefulWidget {
  static const nameRoute = 'admin_chat_screen';
  @override
  _AdminChatScreenState createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  final fireStore = FirebaseFirestore.instance;
  String messageText = '';
  String currentUser = AuthDataSource().auth.currentUser!.email!.toString();
  final messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context)
                      .add(const AuthEvent.signedOut());
                }),
          ],
          title: const Text('Chat'),
          centerTitle: true,
          backgroundColor: inkDark,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: MessagesStream(),
              ),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AdminChatBloc>(context).add(
                            MessageEvent(
                                message: messageText, userEmail: currentUser));

                        messageController.clear();
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

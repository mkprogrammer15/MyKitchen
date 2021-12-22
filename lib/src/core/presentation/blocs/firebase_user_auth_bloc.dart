import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:profi_neon/src/core/data/repositories/firebase_signin_anon.dart';

part 'firebase_user_auth_event.dart';
part 'firebase_user_auth_state.dart';

class FirebaseUserAuthBloc
    extends Bloc<FirebaseUserAuthEvent, FirebaseUserauthState> {
  FirebaseUserAuthBloc() : super(FirebaseuserauthInitial());

  @override
  Stream<FirebaseUserauthState> mapEventToState(
    FirebaseUserAuthEvent event,
  ) async* {
    if (event is FirebaseUserAuthEvent) {
      await AuthServiceAnon.signInAnon();
      yield UserSigninState();
    }
  }
}

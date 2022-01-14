import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_repository.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  FirebaseAuthBloc({
    required this.authRepository,
  }) : super(FirebaseauthInitial());

  final AuthRepository authRepository;

  @override
  Stream<FirebaseAuthState> mapEventToState(
    FirebaseAuthEvent event,
  ) async* {
    if (event is SignInEvent) {
      String? errorMessage;
      await authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      yield SignInState(errorMessage: errorMessage);
    }

    if (event is RegisterEvent) {
      await authRepository.registerWithEmailAndPassword(
          email: event.email, password: event.password, name: event.email);
    }

    if (event is SignOutEvent) {
      await authRepository.signOut();
    }
  }
}

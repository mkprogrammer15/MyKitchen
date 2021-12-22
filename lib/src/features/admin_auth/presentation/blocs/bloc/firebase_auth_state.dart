part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthState extends Equatable {
  const FirebaseAuthState();

  @override
  List<Object> get props => [];
}

class FirebaseauthInitial extends FirebaseAuthState {}

class SignInState extends FirebaseAuthState {
  final String? errorMessage;
  const SignInState({
    this.errorMessage,
  });
  @override
  List<Object> get props => [];
}

class RegisterState extends FirebaseAuthState {}

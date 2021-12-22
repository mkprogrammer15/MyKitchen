part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthEvent extends Equatable {
  const FirebaseAuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends FirebaseAuthEvent {
  String email;
  String password;
  SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [];
}

class RegisterEvent extends FirebaseAuthEvent {
  String email;
  String password;
  String name;
  RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
  });
  @override
  List<Object> get props => [];
}

class SignOutEvent extends FirebaseAuthEvent {
  @override
  List<Object> get props => [];
}

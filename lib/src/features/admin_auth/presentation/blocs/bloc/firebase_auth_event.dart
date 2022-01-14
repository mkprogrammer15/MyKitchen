part of 'firebase_auth_bloc.dart';

abstract class FirebaseAuthEvent extends Equatable {
  const FirebaseAuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends FirebaseAuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends FirebaseAuthEvent {
  final String email;
  final String password;
  final String name;
  const RegisterEvent({
    required this.email,
    required this.password,
    required this.name,
  });
  @override
  List<Object> get props => [email, password, name];
}

class SignOutEvent extends FirebaseAuthEvent {
  @override
  List<Object> get props => [];
}

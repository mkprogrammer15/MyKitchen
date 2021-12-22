part of 'firebase_user_auth_bloc.dart';

abstract class FirebaseUserAuthEvent extends Equatable {
  const FirebaseUserAuthEvent();

  @override
  List<Object> get props => [];
}

class UserSigninAnonEvent extends FirebaseUserAuthEvent {}

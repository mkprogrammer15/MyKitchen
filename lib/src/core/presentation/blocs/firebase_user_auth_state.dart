part of 'firebase_user_auth_bloc.dart';

abstract class FirebaseUserauthState extends Equatable {
  const FirebaseUserauthState();

  @override
  List<Object> get props => [];
}

class FirebaseuserauthInitial extends FirebaseUserauthState {}

class UserSigninState extends FirebaseUserauthState {}

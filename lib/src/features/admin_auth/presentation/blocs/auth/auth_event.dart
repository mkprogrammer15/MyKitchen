part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  //check auth status and signout if needed
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.signedOut() = SignedOut;
}

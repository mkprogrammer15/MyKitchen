part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState(
      {required EmailAddress emailAddress,
      required Password password,
      required bool isSubmitting,
      required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
      required bool showErrorMessages}) = _SignInState;

  factory SignInState.initial() => SignInState(
      emailAddress: EmailAddress(''),
      password: Password(''),
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
      showErrorMessages: false);
}

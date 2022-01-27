import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_neon/src/features/admin_auth/data/models/email_address.dart';
import 'package:profi_neon/src/features/admin_auth/data/models/password.dart';
import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_failure.dart';
import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_repository.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository _authRepository;

  SignInBloc(this._authRepository) : super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    yield* event.map(emailChanged: (event) async* {
      yield state.copyWith(
        emailAddress: EmailAddress(event.email),
        authFailureOrSuccessOption: none(),
      );
    }, passwordChanged: (event) async* {
      yield state.copyWith(
          password: Password(event.password),
          authFailureOrSuccessOption: none());
    }, registerWithEmailAndPasswordPressed: (event) async* {
      yield* _performActionOnAuthWithEmailAndPassword(
          _authRepository.registerWithEmailAndPassword);
    }, signInWithEmailAndPasswordPressed: (event) async* {
      yield* _performActionOnAuthWithEmailAndPassword(
          _authRepository.signInWithEmailAndPassword);
    });
  }

  Stream<SignInState> _performActionOnAuthWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function(
            {required EmailAddress email, required Password password})
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      failureOrSuccess = await forwardedCall(
          email: state.emailAddress, password: state.password);
    }

    yield state.copyWith(
        showErrorMessages: true,
        isSubmitting: false,
        authFailureOrSuccessOption: optionOf(
            failureOrSuccess)); // failureOrSuccess == null ? none() : some(failureOrSuccess). use dartz optionOf
  }
}

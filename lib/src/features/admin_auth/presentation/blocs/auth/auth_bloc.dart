import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthCheckRequested>((event, emit) async {
      try {
        final user = await _authRepository.getSignedInUser();

        user.fold(() => emit(const AuthState.unauthenticated()),
            (a) => emit(const AuthState.authenticated()));
      } on PlatformException catch (_) {}
    });

    on<SignedOut>((event, emit) async {
      await _authRepository.signOut();
      emit(const Unauthenticated());
    });
  }

  // @override
  // Stream<AuthState> mapEventToState(AuthEvent event) async* {
  //   yield* event.map(authCheckRequested: (event) async* {
  //     final userOption = await _authRepository.getSignedInUser();

  //     yield userOption.fold(() => const AuthState.unauthenticated(),
  //         (_) => const AuthState.authenticated());
  //   }, signedOut: (event) async* {
  //     await _authRepository.signOut();
  //     yield const AuthState.unauthenticated();
  //   });
  // }
}

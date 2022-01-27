import 'package:dartz/dartz.dart';
import 'package:profi_neon/src/features/admin_auth/data/models/email_address.dart';
import 'package:profi_neon/src/features/admin_auth/data/models/password.dart';
import 'package:profi_neon/src/features/admin_auth/domain/entities/user.dart';
import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_failure.dart';

abstract class AuthRepository {
  Future<Option<User>> getSignedInUser();
  //cant return void for right side, -> Unit
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress email,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress email,
    required Password password,
  });

  Future<void> signOut();
}

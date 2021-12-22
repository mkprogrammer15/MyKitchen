import 'package:firebase_auth/firebase_auth.dart';
import 'package:profi_neon/src/features/admin_auth/data/data_sources/auth_data_source.dart';
import 'package:profi_neon/src/features/admin_auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthDataSource authDataSource;
  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<dynamic> registerWithEmailAndPassword(
      {required String name,
      required String password,
      required String email}) async {
    await authDataSource.registerWithEmailAndPassword(
        name: name, password: password, email: email);
  }

  @override
  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await authDataSource.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await authDataSource.signOut();
  }
}

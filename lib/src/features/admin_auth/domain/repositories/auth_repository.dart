abstract class AuthRepository {
  Future registerWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {}

  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {}

  Future<void> signOut() async {}
}

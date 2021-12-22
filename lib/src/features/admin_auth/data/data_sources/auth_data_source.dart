import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final auth = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;
      await user!.updateDisplayName(name);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential =
          auth.signInWithEmailAndPassword(email: email, password: password);
      print('${userCredential.toString()} is logged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e.code);
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}

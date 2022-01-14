import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:profi_neon/src/features/admin_auth/data/models/admin_model.dart';

class AuthDataSource {
  final auth = FirebaseAuth.instance;

  //create user object based on Firebase user
  AdminModel _userFromFirebaseUser(User? user) =>
      AdminModel(uid: user!.uid, email: user.email!, name: user.displayName!);

  Future registerWithEmailAndPassword(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;
      await user!.updateDisplayName(email);
      print('my uid is ${result.user!.uid}');
      print('my name is ${result.user!.displayName}');
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e.code);
      } else if (e.code == 'wrong-password') {}
      return 'something went wrong';
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}

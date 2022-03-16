import 'package:firebase_auth/firebase_auth.dart';

mixin AuthServiceAnon {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signInAnon() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

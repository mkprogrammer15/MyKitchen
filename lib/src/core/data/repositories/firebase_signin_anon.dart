import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceAnon {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signInAnon() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      return userCredential;
    } catch (e) {
      print('Something went wront Anonymous');
      return null;
    }
  }
}

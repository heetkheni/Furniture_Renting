import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  Future loginUserwithEmailandPassword(String email, String password) async {
    try {
      UserCredential user = await (_auth.signInWithEmailAndPassword(
          email: email, password: password));
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signUpUserwithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      UserCredential user = await (_auth.createUserWithEmailAndPassword(
          email: email, password: password));
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

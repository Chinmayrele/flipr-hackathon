import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHandler {
  static Future<User?> signUp(String email, String password) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      createUser();
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      if (e.code == 'user-not-found') {
        throw 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        throw 'Wrong password provided for that user.';
      } else {
        throw "Error occured!!";
      }
    }
  }

  static Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      createUser();
      return authResult.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  static createUser() {
    FirebaseDatabase.instance
        .reference()
        .child("Users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .set({"email": FirebaseAuth.instance.currentUser!.email});
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

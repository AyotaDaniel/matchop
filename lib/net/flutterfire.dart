import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e) {
    if ('Weak-password' == e.code) {
      print('The password provided is too weak.');
    } else if ('email-already-in-use' == e.code) {
      print('The account already exists for that email.');
    }

    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<bool> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
///@author Timothy Timrin

//TODO: comment
class AuthLogic {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);
  }

  Future<String> get currentUserId async {
    final FirebaseUser user = await _auth.currentUser();
    return user?.uid;
  }

  Future<FirebaseUser> handleSignIn(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: email, password: password)).user;
    print("signed in " + user.uid);
    return user;
  }

  Future<FirebaseUser> handleRegistration(String email, String password) async {
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
        email: email, password: password)).user;
    print("signed up user " + user.uid);
    return user;
  }

}
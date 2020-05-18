import 'package:dare_n_share_app/models/user.dart';
import 'package:dare_n_share_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

///@author Timothy Timrin

//TODO: comment
class AuthLogic {
  ///Provide an instance of the class
  static final AuthLogic instance = AuthLogic._();

  AuthLogic._(); //Private constructor

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();

  Stream<String> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);
  }

  Future<String> get currentUserId async {
    final FirebaseUser user = await _auth.currentUser();
    return user?.uid;
  }

  Future<FirebaseUser> handleSignIn(String email, String password) async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    print("signed in " + user.uid);
    return user;
  }

  ///Method for registering a user
  ///
  /// Attempts to register a new user with the provided parameters
  /// The user is registered in firebase and in the dare db.
  /// If an error occurs when attempting to register a user the future will contain an error
  Future<FirebaseUser> handleRegistration(
      String email, String userName, String password) async {
    //First we create the user in firebase with the provided credentials.
    //If the user is successfully created, we then create the user in the dare db with the uid of the firebase user.
    //If adding the user to dare db fails for whatever reason the user is removed from firebase.
    // This is because users that are signed up in firebase cannot re-register to be added in the dare db.
    //Only registering in the user in firebase would exhaust that users email and result in a broken user.

    //Create a user in firebase with the provided credentials, if this fails an exception is thrown
    final FirebaseUser user = (await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((user) {
      //Register the user in the dare n share backend
      String userAsJson =
          User(uid: user.user.uid, name: userName, email: email).toJson();

      _authService.registerUser(userAsJson).catchError((error) {
        //Could not register the user in dare db, Remove the user from firebase
        print("could not register deleting user");
        user.user.delete();
      });
      return user;
    }))
        .user;

    print("signed up user " + user.uid);
    return user;
  }
}

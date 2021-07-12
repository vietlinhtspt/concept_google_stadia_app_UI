import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthenticationService({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : this._firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        this._googleSignIn = googleSignIn ?? GoogleSignIn();

  // Sign up services

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    print("Create account with $email, $password");
    return await this._firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  // Log in services
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.accessToken,
        accessToken: googleSignInAuthentication.idToken);
    await _firebaseAuth.signInWithCredential(authCredential);
    final currentUser = _firebaseAuth.currentUser;
    return currentUser;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    return await this._firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  Future<void> signOut() async {
    print("Calling sign Out");
    return await Future.wait(
        [this._firebaseAuth.signOut(), this._googleSignIn.signOut()]);
  }

  Future<bool> isSignedIn() async {
    return await this._firebaseAuth.currentUser != null;
  }

  Future<User> getCurrentUser() async {
    return await this._firebaseAuth.currentUser;
  }

  // incognito services

  // forgot password services
  Future<void> resetPassword(String email) async {
    return await this._firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

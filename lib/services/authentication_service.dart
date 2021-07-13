import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  AuthenticationService(
      {FirebaseAuth firebaseAuth,
      GoogleSignIn googleSignIn,
      FacebookAuth facebookAuth})
      : this._firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        this._googleSignIn = googleSignIn ?? GoogleSignIn(),
        this._facebookAuth = facebookAuth ?? FacebookAuth.instance;

  // Sign up services
  Future<void> loginWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result != null) {
        // Create a credential from the access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.token);
        // Once signed in, return the UserCredential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return null;
    } on FacebookAuthException catch (e) {
      print(e.message);
      this._facebookAuth.logOut();
    }
  }

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
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
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
    return await Future.wait([
      this._firebaseAuth.signOut(),
      this._googleSignIn.signOut(),
      this._facebookAuth.logOut()
    ]);
  }

  bool isSignedIn() {
    return this._firebaseAuth.currentUser != null;
  }

  User getCurrentUser() {
    return this._firebaseAuth.currentUser;
  }

  // incognito services

  // forgot password services
  Future<void> resetPassword(String email) async {
    return await this._firebaseAuth.sendPasswordResetEmail(email: email);
  }
}

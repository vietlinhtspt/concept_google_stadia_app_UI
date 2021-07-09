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

  // incognito services

  // forgot password services
}

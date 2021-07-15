import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    print("Create account with $email, $password");
    return await this._firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);
  }

  // Log in services
  Future<User> loginWithFacebook() async {
    // try {
    //   final result = await FacebookAuth.instance.login();
    //   if (result != null) {
    //     // Create a credential from the access token
    //     final OAuthCredential credential =
    //         FacebookAuthProvider.credential(result.token);
    //     // Once signed in, return the UserCredential
    //     return (await FirebaseAuth.instance.signInWithCredential(credential))
    //         .user;
    //   }
    // } on FacebookAuthException catch (e) {
    //   print(e.message);
    //   this._facebookAuth.logOut();
    // }

    final result = await FacebookAuth.instance.login();
    final OAuthCredential credential =
        FacebookAuthProvider.credential(result.token);
    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    return (await _firebaseAuth.signInWithCredential(authCredential)).user;
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    return (await this._firebaseAuth.signInWithEmailAndPassword(
            email: email.trim(), password: password.trim()))
        .user;
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

  // Firebase API
  Future<List<DocumentSnapshot>> getUserDocuments() async {
    User firebaseUser = this._firebaseAuth.currentUser;
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: firebaseUser.uid)
        .get();
    return result.docs;
  }

  Future<void> submitUserDocuments(String userName) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(this._firebaseAuth.currentUser.uid)
        .set({
      'userName': userName,
      'id': this._firebaseAuth.currentUser.uid,
      "messageIDs": [],
      'friendList': []
    });
  }

  Future<List<dynamic>> getMessageIDs() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(this._firebaseAuth.currentUser.uid)
        .get();
    return snapshot.data()["messageIDs"];
  }

  Future<void> getListMessages() async {
    final List<dynamic> messageIDs = await this.getMessageIDs();
    print("Message IDs length: ${messageIDs.length}");
  }

  Future<void> requestNewMessage(String userId) async {}

  Future<String> searchUserByUsername(String userName) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
    print(snapshot.docs.length);
    for (QueryDocumentSnapshot documentSnapshot in snapshot.docs) {
      if (documentSnapshot.data()["userName"] == userName.trim())
        return documentSnapshot.data()["id"];
    }
    return null;
  }

  Future<void> addNewFriend(String userId) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(this._firebaseAuth.currentUser.uid)
        .update({
      "friendList": FieldValue.arrayUnion([userId])
    });
  }
}

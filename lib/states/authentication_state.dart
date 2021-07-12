import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationStateInitial extends AuthenticationState {}

class AuthenticationStateFailure extends AuthenticationState {}

class AuthenticationStateSuccess extends AuthenticationState {
  final User firebaseUser;
  AuthenticationStateSuccess({this.firebaseUser});
  @override
  List<Object> get props => [this.firebaseUser];

  @override
  String toString() {
    return this.firebaseUser.email.toString();
  }
}

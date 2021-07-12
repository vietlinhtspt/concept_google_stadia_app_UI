import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationService authenticationService;
  AuthenticationCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(AuthenticationStateInitial());

  void checkLoggedIn() async {
    final bool isSignedIn = await this.authenticationService.isSignedIn();
    if (isSignedIn) {
      User currentUser = await this.authenticationService.getCurrentUser();
      emit(AuthenticationStateSuccess(firebaseUser: currentUser));
    } else {
      emit(AuthenticationStateFailure());
    }
  }

  void logIn() async {
    final bool isSignedIn = await this.authenticationService.isSignedIn();
    if (isSignedIn) {
      emit(AuthenticationStateSuccess(
          firebaseUser: await this.authenticationService.getCurrentUser()));
    } else {
      emit(AuthenticationStateFailure());
    }
  }

  void logOut() async {
    await this.authenticationService.signOut();
    emit(AuthenticationStateFailure());
  }
}

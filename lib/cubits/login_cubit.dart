import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/login_state.dart';
import 'package:stadia_app/validators/authentication_validator.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationService authenticationService;
  LoginCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(LoginState.initial());

  void reset() {
    emit(LoginState.initial());
  }

  void emailChanged(String email) async {
    final LoginState loginState = state;
    emit(loginState.copyWith(
        isValidEmail: AuthenticationValidator.isValidEmail(email.trim())));
  }

  void passwordChanged(String password) async {
    final LoginState loginState = state;
    emit(loginState.copyWith(
        isValidPassword: AuthenticationValidator.isValidPassword(password)));
  }

  void submit(String email, String password) async {
    emit(LoginState.submit());
    try {
      await authenticationService.signInWithEmailAndPassword(
          email.trim(), password);
      emit(LoginState.success());
    } on PlatformException catch (err) {
      emit(LoginState.failure(err.message));
      // Handle err
    } catch (err) {
      // other types of Exceptions
      print(err);
      LoginState.failure(
          "Some thing wrong with server, try again in minutes or contact service.");
    }
  }

  void loginWithGoogle() async {
    emit(LoginState.submit());
    try {
      await authenticationService.signInWithGoogle();
      emit(LoginState.success());
    } on PlatformException catch (err) {
      emit(LoginState.failure(err.message));
      // Handle err
    } catch (err) {
      // other types of Exceptions
      print(err);
      LoginState.failure(
          "Some thing wrong with server, try again in minutes or contact service.");
    }
  }

  void loginWithFacebook() async {
    emit(LoginState.submit());
    try {
      await authenticationService.loginWithFacebook();
      emit(LoginState.success());
    } on PlatformException catch (err) {
      emit(LoginState.failure(err.message));
      // Handle err
    } catch (err) {
      // other types of Exceptions
      print("Error $err");
      LoginState.failure(
          "Some thing wrong with server, try again in minutes or contact service.");
    }
  }
}

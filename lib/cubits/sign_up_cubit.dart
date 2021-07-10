import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/sign_up_state.dart';
import 'package:stadia_app/validators/authentication_validator.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationService authenticationService;

  SignUpCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(SignUpState.initial());

  Future<SignUpState> emailChanged(String email) async {
    final SignUpState signUpState = state;
    emit(signUpState.copyWith(
        isValidEmail: AuthenticationValidator.isValidEmail(email.trim())));
  }

  Future<SignUpState> passwordChanged(String password) async {
    final SignUpState signUpState = state;
    emit(signUpState.copyWith(
        isValidPassword: AuthenticationValidator.isValidPassword(password)));
  }

  Future<SignUpState> confirmPasswordChanged(String password) async {
    final SignUpState signUpState = state;
    emit(signUpState.copyWith(
        isValidConfirmPassword:
            AuthenticationValidator.isValidPassword(password)));
  }

  Future<SignUpState> submit(String email, String password) async {
    emit(SignUpState.submit());
    try {
      await authenticationService.createUserWithEmailAndPassword(
          email.trim(), password);
      emit(SignUpState.success());
    } on PlatformException catch (err) {
      emit(SignUpState.failure(err.message));
      // Handle err
    } catch (err) {
      // other types of Exceptions
      SignUpState.failure(
          "Some thing wrong with server, try again in minutes or contact service.");
    }
  }
}

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/forgot_password_state.dart';
import 'package:stadia_app/states/login_state.dart';
import 'package:stadia_app/validators/authentication_validator.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthenticationService authenticationService;
  ForgotPasswordCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(ForgotPasswordState.initial());

  void reset() {
    emit(ForgotPasswordState.initial());
  }

  void emailChanged(String email) {
    final ForgotPasswordState forgotPasswordState = state;
    emit(forgotPasswordState.copyWith(
        isValidEmail: AuthenticationValidator.isValidEmail(email.trim())));
  }

  // void verifyCodeChanged(String verifyCode) {
  //   final ForgotPasswordState forgotPasswordState = state;
  //   emit(forgotPasswordState.copyWith(
  //       isValidVerifyCode:
  //           AuthenticationValidator.isValidVerifyCode(verifyCode.trim())));
  // }

  // void passwordChanged(String password) async {
  //   final ForgotPasswordState forgotPasswordState = state;
  //   emit(forgotPasswordState.copyWith(
  //       isValidPassword: AuthenticationValidator.isValidPassword(password)));
  // }

  // void confirmPasswordChanged(String password) async {
  //   final ForgotPasswordState forgotPasswordState = state;
  //   emit(forgotPasswordState.copyWith(
  //       isValidConfirmPassword:
  //           AuthenticationValidator.isValidPassword(password)));
  // }

  void resetPasswordByMail(String email) async {
    emit(ForgotPasswordState.submit());
    try {
      await authenticationService.resetPassword(email.trim());
      emit(ForgotPasswordState.success());
    } on PlatformException catch (err) {
      emit(ForgotPasswordState.failure(err.message));
      // Handle err
    } catch (err) {
      // other types of Exceptions
      print(err);
      ForgotPasswordState.failure(
          "Some thing wrong with our server, try again in minutes or contact our service.");
    }
  }
}

class ForgotPasswordState {
  final bool isValidEmail;
  final bool isValidVerifyCode;

  final bool isValidPassword;
  final bool isValidConfirmPassword;

  final bool isSubmitingVerifyCode;
  final bool isSuccessVerifyCode;
  final bool onFailureVerifyCode;

  final bool isSubmiting;
  final bool isSuccess;
  final bool onFailure;

  final String errText;

  bool get isSimilarPasswordAndConfirmPassword =>
      this.isValidConfirmPassword && this.isValidPassword;

  bool get isValidEmailAndPassword =>
      this.isValidEmail && this.isValidPassword && this.isValidConfirmPassword;

  const ForgotPasswordState({
    this.isValidEmail,
    this.isValidVerifyCode,
    this.isValidPassword,
    this.isValidConfirmPassword,
    this.isSubmitingVerifyCode,
    this.isSuccessVerifyCode,
    this.onFailureVerifyCode,
    this.isSubmiting,
    this.isSuccess,
    this.onFailure,
    this.errText,
  });

  factory ForgotPasswordState.initial() {
    return ForgotPasswordState(
        isValidEmail: false,
        isValidVerifyCode: false,
        isValidPassword: false,
        isValidConfirmPassword: false,
        isSubmitingVerifyCode: false,
        isSuccessVerifyCode: false,
        onFailureVerifyCode: false,
        isSubmiting: false,
        isSuccess: false,
        onFailure: false);
  }

  factory ForgotPasswordState.submitVerifyCode() {
    return ForgotPasswordState(
        isValidEmail: true,
        isValidVerifyCode: true,
        isValidPassword: false,
        isValidConfirmPassword: false,
        isSubmitingVerifyCode: true,
        isSuccessVerifyCode: false,
        onFailureVerifyCode: false,
        isSubmiting: false,
        isSuccess: false,
        onFailure: false);
  }

  factory ForgotPasswordState.successVerifyCode() {
    return ForgotPasswordState(
        isValidEmail: true,
        isValidVerifyCode: true,
        isValidPassword: false,
        isValidConfirmPassword: false,
        isSubmitingVerifyCode: false,
        isSuccessVerifyCode: true,
        onFailureVerifyCode: false,
        isSubmiting: false,
        isSuccess: false,
        onFailure: false);
  }

  factory ForgotPasswordState.failureVerifyCode() {
    return ForgotPasswordState(
        isValidEmail: true,
        isValidVerifyCode: true,
        isValidPassword: false,
        isValidConfirmPassword: false,
        isSubmitingVerifyCode: false,
        isSuccessVerifyCode: false,
        onFailureVerifyCode: true,
        isSubmiting: false,
        isSuccess: false,
        onFailure: false);
  }

  factory ForgotPasswordState.submit() {
    return ForgotPasswordState(
        isValidEmail: true,
        isValidVerifyCode: true,
        isValidPassword: true,
        isValidConfirmPassword: true,
        isSubmitingVerifyCode: false,
        isSuccessVerifyCode: true,
        onFailureVerifyCode: false,
        isSubmiting: true,
        isSuccess: false,
        onFailure: false);
  }

  factory ForgotPasswordState.success() {
    return ForgotPasswordState(
        isValidEmail: true,
        isValidVerifyCode: true,
        isValidPassword: true,
        isValidConfirmPassword: true,
        isSubmitingVerifyCode: false,
        isSuccessVerifyCode: true,
        onFailureVerifyCode: false,
        isSubmiting: false,
        isSuccess: true,
        onFailure: false);
  }
  factory ForgotPasswordState.failure(String errText) {
    return ForgotPasswordState(
        isValidEmail: true,
        isValidVerifyCode: true,
        isValidPassword: true,
        isValidConfirmPassword: true,
        isSubmitingVerifyCode: false,
        isSuccessVerifyCode: true,
        onFailureVerifyCode: false,
        isSubmiting: false,
        isSuccess: false,
        onFailure: true,
        errText: errText);
  }

  ForgotPasswordState copyWith(
      {bool isValidEmail,
      bool isValidVerifyCode,
      bool isValidPassword,
      bool isValidConfirmPassword,
      bool isSubmiting,
      bool isSuccess,
      bool onFailure}) {
    return ForgotPasswordState(
        isValidEmail: isValidEmail ?? this.isValidEmail,
        isValidVerifyCode: isValidVerifyCode ?? this.isValidVerifyCode,
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isValidConfirmPassword:
            isValidConfirmPassword ?? this.isValidConfirmPassword,
        isSubmiting: isSubmiting ?? this.isSubmiting,
        isSuccess: isSuccess ?? this.isSuccess,
        onFailure: onFailure ?? this.onFailure);
  }
}

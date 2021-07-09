class SignUpState {
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isValidConfirmPassword;
  final bool isSubmiting;
  final bool isSuccess;
  final bool onFailure;
  final String errorText;

  bool get isValidEmailAndPassword =>
      this.isValidEmail && this.isValidPassword && this.isValidConfirmPassword;

  const SignUpState({
    this.isValidEmail,
    this.isValidPassword,
    this.isValidConfirmPassword,
    this.isSubmiting,
    this.isSuccess,
    this.onFailure,
    this.errorText,
  });

  factory SignUpState.initial() {
    return SignUpState(
      isValidEmail: false,
      isValidPassword: false,
      isValidConfirmPassword: false,
      isSubmiting: false,
      isSuccess: false,
      onFailure: false,
      errorText: null,
    );
  }
  factory SignUpState.submit() {
    return SignUpState(
      isValidEmail: true,
      isValidPassword: true,
      isValidConfirmPassword: true,
      isSubmiting: true,
      isSuccess: false,
      onFailure: false,
      errorText: null,
    );
  }
  factory SignUpState.failure(String errorText) {
    return SignUpState(
      isValidEmail: true,
      isValidPassword: true,
      isValidConfirmPassword: true,
      isSubmiting: false,
      isSuccess: false,
      onFailure: true,
      errorText: errorText,
    );
  }
  factory SignUpState.success() {
    return SignUpState(
      isValidEmail: true,
      isValidPassword: true,
      isValidConfirmPassword: true,
      isSubmiting: false,
      isSuccess: true,
      onFailure: false,
      errorText: null,
    );
  }

  SignUpState copyWith(
      {bool isValidEmail,
      bool isValidPassword,
      bool isValidConfirmPassword,
      bool isSubmiting,
      bool isSuccess,
      bool onFailure,
      String errorText}) {
    return SignUpState(
        isValidEmail: isValidEmail ?? this.isValidEmail,
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isValidConfirmPassword:
            isValidConfirmPassword ?? this.isValidConfirmPassword,
        isSubmiting: isSubmiting ?? this.isSubmiting,
        isSuccess: isSuccess ?? this.isSuccess,
        onFailure: onFailure ?? this.onFailure,
        errorText: errorText ?? this.errorText);
  }
}

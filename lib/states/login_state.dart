class LoginState {
  final bool isValidEmail;
  final bool isValidPassword;
  final bool isSubmiting;
  final bool isSuccess;
  final bool onFailure;
  final String errorText;

  bool get isValidEmailAndPassword => this.isValidEmail && this.isValidPassword;

  const LoginState(
      {this.isValidEmail,
      this.isValidPassword,
      this.isSubmiting,
      this.isSuccess,
      this.onFailure,
      this.errorText});

  factory LoginState.initial() {
    return LoginState(
        isValidEmail: false,
        isValidPassword: false,
        isSubmiting: false,
        isSuccess: false,
        onFailure: false);
  }
  factory LoginState.submit() {
    return LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmiting: true,
        isSuccess: false,
        onFailure: false);
  }
  factory LoginState.failure(String errorText) {
    return LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmiting: false,
        isSuccess: false,
        onFailure: true,
        errorText: errorText);
  }
  factory LoginState.success() {
    return LoginState(
        isValidEmail: true,
        isValidPassword: true,
        isSubmiting: false,
        isSuccess: true,
        onFailure: false);
  }

  LoginState copyWith(
      {bool isValidEmail,
      bool isValidPassword,
      bool isSubmiting,
      bool isSuccess,
      bool onFailure,
      String errorText}) {
    return LoginState(
        isValidEmail: isValidEmail ?? this.isValidEmail,
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isSubmiting: isSubmiting ?? this.isSubmiting,
        isSuccess: isSuccess ?? this.isSuccess,
        onFailure: onFailure ?? this.onFailure,
        errorText: errorText ?? this.errorText);
  }
}

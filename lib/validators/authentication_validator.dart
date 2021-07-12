class AuthenticationValidator {
  static isValidEmail(String email) {
    // print("Checking $email");
    final regularExpression = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    // print(regularExpression.hasMatch(email));
    return regularExpression.hasMatch(email);
  }

  static isValidPassword(String password) => password.length >= 6;
  static isValidVerifyCode(String verifyCode) => verifyCode.length == 6;
}

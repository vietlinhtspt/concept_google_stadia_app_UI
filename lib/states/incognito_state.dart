class IncognitoState {
  final bool isSubmiting;
  final bool isSuccess;
  final bool onFailure;

  const IncognitoState({this.isSubmiting, this.isSuccess, this.onFailure});

  factory IncognitoState.initial() {
    return IncognitoState(isSubmiting: false, isSuccess: false, onFailure: false);
  }
  factory IncognitoState.submit() {
    return IncognitoState(isSubmiting: true, isSuccess: false, onFailure: false);
  }
  factory IncognitoState.failure() {
    return IncognitoState(isSubmiting: false, isSuccess: false, onFailure: true);
  }
  factory IncognitoState.success() {
    return IncognitoState(isSubmiting: false, isSuccess: true, onFailure: false);
  }

  IncognitoState copyWith({bool isSubmiting, bool isSuccess, bool onFailure}) {
    return IncognitoState(
        isSubmiting: isSubmiting ?? this.isSubmiting,
        isSuccess: isSuccess ?? this.isSuccess,
        onFailure: onFailure ?? this.onFailure);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/user_info_state.dart';
import 'package:stadia_app/validators/authentication_validator.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final AuthenticationService authenticationService;

  UserInfoCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(UserInfoStateInitial());

  void getUserInfo() async {
    emit(UserInfoStateLoading());
    try {
      List<DocumentSnapshot> userDocumetSnapshot =
          await this.authenticationService.getUserDocuments();
      emit(UserInfoStateSuccess(
          userDocumetSnapshot, userDocumetSnapshot.isEmpty ? false : true));
    } catch (e) {}
  }

  void userNameChanged(String userName) {
    final UserInfoStateSuccess userInfoState = state;
    emit(UserInfoStateLoading());
    // print("User name changed");
    emit(userInfoState.copyWith(
        isValidUserName: AuthenticationValidator.isValidPassword(userName)));
  }

  void submitUserName(String userName) {
    print("Submit user name $userName");
    emit(UserInfoStateLoading());
    try {
      this.authenticationService.submitUserDocuments(userName);
      this.getUserInfo();
    } catch (e) {
      emit(UserInfoStateFailure());
    }
  }
}

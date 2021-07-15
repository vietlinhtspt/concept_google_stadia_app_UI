import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/communication_state.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  final AuthenticationService authenticationService;
  CommunicationCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(CommunicationStateInitial());

  void getListMessages() {
    this.authenticationService.getListMessages();
  }

  void sendMessages() {}

  void addFriend(String uid) {
    emit(CommunicationStateLoading());
    try {
      authenticationService.addNewFriend(uid);
      this.getListMessages();
    } catch (e) {
      emit(CommunicationStateFailure());
    }
  }
}

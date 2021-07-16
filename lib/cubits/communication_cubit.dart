import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/communication_state.dart';

class CommunicationCubit extends Cubit<CommunicationState> {
  final AuthenticationService authenticationService;
  CommunicationCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(CommunicationStateInitial());

  // void getListMessages() async {
  //   try {
  //     emit(CommunicationStateLoading());
  //     this.authenticationService.getAllMessages().listen((event) {
  //       print("New snapshot message");
  //       emit(CommunicationStateLoading());
  //       emit(CommunicationStateSuccess(event, false));
  //     });
  //   } catch (e) {
  //     emit(CommunicationStateFailure());
  //   }
  // }

  String getUserID() {
    return this.authenticationService.getUserID;
  }

  void sendMessages(String content, String groupChatID) {
    try {
      emit(CommunicationStateLoading());
      this
          .authenticationService
          .onSendMessage(content: content, groupChatID: groupChatID);
      emit(CommunicationStateSuccess(getUserID()));
    } catch (e) {
      emit(CommunicationStateFailure());
    }
  }

  void addFriend(String uid) {
    emit(CommunicationStateLoading());
    try {
      authenticationService.addNewFriend(uid);
      // this.getListMessages();
    } catch (e) {
      emit(CommunicationStateFailure());
    }
  }
}

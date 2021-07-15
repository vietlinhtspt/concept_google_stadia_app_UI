import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadia_app/services/authentication_service.dart';
import 'package:stadia_app/states/searching_state.dart';

class SearchingCubit extends Cubit<SearchingState> {
  final AuthenticationService authenticationService;
  SearchingCubit(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        this.authenticationService = authenticationService,
        super(SearchingStateInitial());

  void searchUserByUsername(String userName) async {
    try {
      emit(SearchingStateLoading());
      String uid =
          await this.authenticationService.searchUserByUsername(userName);

      emit(SearchingStateSuccess(uid));
    } catch (e) {
      emit(SearchingStateFailure());
    }
  }
}

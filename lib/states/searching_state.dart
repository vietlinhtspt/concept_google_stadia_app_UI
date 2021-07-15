import 'package:equatable/equatable.dart';

abstract class SearchingState extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchingStateInitial extends SearchingState {}

class SearchingStateLoading extends SearchingState {}

class SearchingStateSuccess extends SearchingState {
  final String searchData;
  SearchingStateSuccess(this.searchData);

  @override
  List<Object> get props => [this.searchData];

  // SearchingStateSuccess copyWith(
  //     {List<DocumentSnapshot> userDocumentSnapshot, bool isValidUserName}) {
  //   return SearchingStateSuccess(
  //       userDocumentSnapshot ?? this.userDocumentSnapshot,
  //       isValidUserName ?? this.isValidUserName);
  // }
}

class SearchingStateFailure extends SearchingState {}

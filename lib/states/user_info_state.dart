import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class UserInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInfoStateInitial extends UserInfoState {}

class UserInfoStateLoading extends UserInfoState {}

class UserInfoStateSuccess extends UserInfoState {
  final List<DocumentSnapshot> userDocumentSnapshot;
  final bool isValidUserName;
  UserInfoStateSuccess(this.userDocumentSnapshot, this.isValidUserName);

  @override
  List<Object> get props => [this.userDocumentSnapshot];

  UserInfoStateSuccess copyWith(
      {List<DocumentSnapshot> userDocumentSnapshot, bool isValidUserName}) {
    return UserInfoStateSuccess(
        userDocumentSnapshot ?? this.userDocumentSnapshot,
        isValidUserName ?? this.isValidUserName);
  }
}

class UserInfoStateFailure extends UserInfoState {}

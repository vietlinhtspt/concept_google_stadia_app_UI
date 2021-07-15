import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class CommunicationState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommunicationStateInitial extends CommunicationState {}

class CommunicationStateLoading extends CommunicationState {}

class CommunicationStateSuccess extends CommunicationState {
  final List<DocumentSnapshot> userDocumentSnapshot;
  final bool isValidUserName;
  CommunicationStateSuccess(this.userDocumentSnapshot, this.isValidUserName);

  @override
  List<Object> get props => [this.userDocumentSnapshot];

  CommunicationStateSuccess copyWith(
      {List<DocumentSnapshot> userDocumentSnapshot, bool isValidUserName}) {
    return CommunicationStateSuccess(
        userDocumentSnapshot ?? this.userDocumentSnapshot,
        isValidUserName ?? this.isValidUserName);
  }
}

class CommunicationStateFailure extends CommunicationState {}

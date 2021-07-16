import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class CommunicationState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommunicationStateInitial extends CommunicationState {}

class CommunicationStateLoading extends CommunicationState {}

class CommunicationStateSuccess extends CommunicationState {
  // final QuerySnapshot userDocumentSnapshot;
  final String uid;
  CommunicationStateSuccess(this.uid);

  @override
  List<Object> get props => [this.uid];

  CommunicationStateSuccess copyWith(
      {QuerySnapshot userDocumentSnapshot, String uid}) {
    return CommunicationStateSuccess(uid ?? this.uid);
  }
}

class CommunicationStateFailure extends CommunicationState {}

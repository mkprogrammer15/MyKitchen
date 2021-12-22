part of 'requests_bloc.dart';

abstract class RequestsState extends Equatable {
  const RequestsState();

  @override
  List<Object> get props => [];
}

class FirebaseordersInitial extends RequestsState {}

class GetRequestsState extends RequestsState {
  final List<RequestEntity> documentList;
  const GetRequestsState(this.documentList);

  @override
  List<Object> get props => [];
}

class DeleteCollectionDocumentState extends RequestsState {
  final String keyId;

  const DeleteCollectionDocumentState({
    required this.keyId,
  });

  @override
  List<Object> get props => [];
}

class UpdateCollectionDocumentState extends RequestsState {
  final String keyId;
  final String adminComment;
  const UpdateCollectionDocumentState(
      {required this.keyId, required this.adminComment});

  @override
  List<Object> get props => [];
}

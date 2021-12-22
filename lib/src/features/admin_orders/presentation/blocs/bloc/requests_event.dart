part of 'requests_bloc.dart';

abstract class RequestsEvent extends Equatable {
  const RequestsEvent();

  @override
  List<Object> get props => [];
}

class GetRequestsEvent extends RequestsEvent {
  @override
  List<Object> get props => [];
}

class DeleteCollectionDocumentEvent extends RequestsEvent {
  final String keyId;
  const DeleteCollectionDocumentEvent({
    required this.keyId,
  });

  @override
  List<Object> get props => [];
}

class UpdateCollectionDocumentEvent extends RequestsEvent {
  final String keyId;
  final String adminComment;
  const UpdateCollectionDocumentEvent(
      {required this.keyId, required this.adminComment});

  @override
  List<Object> get props => [];
}

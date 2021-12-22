import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';
import 'package:profi_neon/src/features/admin_orders/domain/repositories/request_repository.dart';

part 'requests_event.dart';
part 'requests_state.dart';

@injectable
class RequestsBloc extends Bloc<RequestsEvent, RequestsState> {
  RequestsBloc({required this.requestRepository})
      : super(FirebaseordersInitial());

  final RequestRepository requestRepository;

  @override
  Stream<RequestsState> mapEventToState(
    RequestsEvent event,
  ) async* {
    if (event is GetRequestsEvent) {
      final documentList = await requestRepository.getPosts();
      yield GetRequestsState(documentList);
    }

    if (event is DeleteCollectionDocumentEvent) {
      final keyId = event.keyId;
      requestRepository.deleteDocument(keyId);
      yield DeleteCollectionDocumentState(keyId: keyId);
    }

    if (event is UpdateCollectionDocumentEvent) {
      final keyId = event.keyId;
      final adminComment = event.adminComment;
      requestRepository.updateDocumentByAdminComment(keyId, adminComment);
      yield UpdateCollectionDocumentState(
          keyId: keyId, adminComment: adminComment);
    }
  }
}

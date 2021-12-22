import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';

abstract class RequestRepository {
  Future<List<RequestEntity>> getPosts();

  void deleteDocument(String keyId);

  void updateDocumentByAdminComment(String keyId, String adminComment);
}

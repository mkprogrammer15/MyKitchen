import 'package:injectable/injectable.dart';
import 'package:profi_neon/src/features/admin_orders/data/data_sources/request_data_source.dart';
import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';
import 'package:profi_neon/src/features/admin_orders/domain/repositories/request_repository.dart';

@LazySingleton(as: RequestRepository)
class RequestRepositoryImpl implements RequestRepository {
  RequestDataSource requestDataSource;
  RequestRepositoryImpl({
    required this.requestDataSource,
  });

  @override
  // ignore: prefer_expression_function_bodies
  Future<List<RequestEntity>> getPosts() async {
    return await requestDataSource.getPosts();
  }

  @override
  void deleteDocument(String keyId) {
    requestDataSource.deleteDocument(keyId);
  }

  @override
  void updateDocumentByAdminComment(String keyId, String adminComment) {
    requestDataSource.updateDocumentByAdminComment(keyId, adminComment);
  }
}

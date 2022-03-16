import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_neon/src/features/admin_orders/data/models/request_model.dart';
import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';

@lazySingleton
class RequestDataSource {
  final firebaseFirestore = FirebaseFirestore.instance;

  Future<List<RequestEntity>> getPosts() async {
    final qn = await firebaseFirestore.collection('Requests').orderBy('Anfrage vom').get();

    final data = qn.docs;

    final requests = <RequestEntity>[];
    for (final item in data) {
      final request = RequestModel.fromSnapshot(item);
      requests.add(request);
    }
    return requests;
  }

  void deleteDocument(String keyId) {
    firebaseFirestore.collection('Requests').doc(keyId).delete();
  }

  void updateDocumentByAdminComment(String keyId, String adminComment) {
    var update = <String, String>{};
    update = {'Administrator Anmerkung': adminComment};
    firebaseFirestore.collection('Requests').doc(keyId).set(update, SetOptions(merge: true));
  }
}

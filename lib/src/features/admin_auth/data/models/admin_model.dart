import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profi_neon/src/features/admin_auth/domain/entities/auth_entity.dart';

class AdminModel extends AuthEntity {
  AdminModel({
    required String email,
    //required String password,
    required String name,
    required String uid,
  }) : super(email: email, uid: uid, name: name);

  factory AdminModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snap) {
    final adminModel = AdminModel(
        email: snap.data()['email'].toString(),
        // password: snap.data()['password'].toString(),
        name: snap.data()['name'].toString(),
        uid: snap.data()['id'].toString());
    return adminModel;
  }
}

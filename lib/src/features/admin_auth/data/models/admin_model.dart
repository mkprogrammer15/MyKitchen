import 'package:profi_neon/src/features/admin_auth/domain/entities/auth_entity.dart';

class AdminModel extends AuthEntity {
  AdminModel({
    required String email,
    required String password,
    required String name,
    required String id,
  }) : super(email: email, id: id, name: name, password: password);
}

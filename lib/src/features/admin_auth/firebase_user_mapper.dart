import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:profi_neon/src/core/value_objects.dart';
import 'package:profi_neon/src/features/admin_auth/domain/entities/user.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() => User(id: UniqueId.fromUniqueString(uid));
}

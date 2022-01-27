import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:profi_neon/src/core/value_objects.dart';
import 'package:profi_neon/src/features/admin_auth/data/models/email_address.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required UniqueId id,
  }) = _User;
}

import 'package:dartz/dartz.dart';
import 'package:profi_neon/src/core/failures.dart';
import 'package:profi_neon/src/core/value_objects.dart';
import 'package:profi_neon/src/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }
  const EmailAddress._(this.value);
}

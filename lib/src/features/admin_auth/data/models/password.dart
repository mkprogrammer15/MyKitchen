import 'package:dartz/dartz.dart';
import 'package:profi_neon/src/core/failures.dart';
import 'package:profi_neon/src/core/value_objects.dart';
import 'package:profi_neon/src/core/value_validators.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }
  const Password._(this.value);
}

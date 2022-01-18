import 'package:dartz/dartz.dart';
import 'package:profi_neon/src/core/failures.dart';
import 'package:profi_neon/src/export.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  //Override toString
  @override
  String toString() => '(value: $value)';
}

import 'package:dartz/dartz.dart';
import 'package:profi_neon/src/core/errors.dart';
import 'package:profi_neon/src/core/failures.dart';
import 'package:profi_neon/src/export.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();
  bool isNotValid() => value.isLeft();

  T getOrCrash() {
    return value.fold(
        (valueFailure) => throw UnexpectedValueError(valueFailure),
        (r) => r); //instead (r)=> r just use id
  }

  //Override toString
  @override
  String toString() => '(value: $value)';
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory UniqueId() {
    return UniqueId._(right(const Uuid().v1()));
  }
  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(
      right(uniqueId),
    );
  }
  const UniqueId._(this.value);
}

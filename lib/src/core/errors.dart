import 'package:profi_neon/src/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() =>
      'Encountered a ValueFailure at an unrecoverable point. Terminating. Failure was: $valueFailure';
}

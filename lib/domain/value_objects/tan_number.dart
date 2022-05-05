import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class TANNumberFailure extends Failure {}

class InvalidTANNumberFailure extends TANNumberFailure {
  @override
  String get message => 'Invalid TAN Number';
}

const tanRegExp = r'^([A-Z]{4})([0-9]{5})([A-Z])$';

class TANNumber {
  final String? value;

  const TANNumber._(this.value);

  static Either<TANNumberFailure, TANNumber> create(String? tanNumber) {
    if (tanNumber != null) {
      final match = RegExp(tanRegExp).firstMatch(tanNumber);
      if (match == null) return left(InvalidTANNumberFailure());
      return right(TANNumber._(tanNumber));
    }
    return right(TANNumber._(tanNumber));
  }
}
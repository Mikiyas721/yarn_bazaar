import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class PANNumberFailure extends Failure {}

class InvalidGSTNumberFailure extends PANNumberFailure {
  @override
  String get message => 'Invalid PAN Number';
}

const panRegExp = r'^([A-Z]{5})([0-9]{4})([A-Z])$';

class PANNumber {
  final String? value;

  const PANNumber._(this.value);

  static Either<PANNumberFailure, PANNumber> create(String? panNumber) {
    if (panNumber != null) {
      final match = RegExp(panRegExp).firstMatch(panNumber);
      if (match == null) return left(InvalidGSTNumberFailure());
      return right(PANNumber._(panNumber));
    }
    return right(PANNumber._(panNumber));
  }
}

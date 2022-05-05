import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class GSTNumberFailure extends Failure {}

class InvalidGSTNumberFailure extends GSTNumberFailure {
  @override
  String get message => 'Invalid GST Number';
}

const gstRegExp = r'^([0-9]{2})([A-Z]{5})([0-9]{4})([A-Z])([0-9])(Z)([A-Z]|[0-9])$';

class GSTNumber {
  final String? value;

  const GSTNumber._(this.value);

  static Either<GSTNumberFailure, GSTNumber> create(String? gstNumber) {
    if (gstNumber != null) {
      final match = RegExp(gstRegExp).firstMatch(gstNumber);
      if (match == null) return left(InvalidGSTNumberFailure());
      return right(GSTNumber._(gstNumber));
    }
    return right(GSTNumber._(gstNumber));
  }
}

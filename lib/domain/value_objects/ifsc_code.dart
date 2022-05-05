import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class IFSCCodeFailure extends Failure {}

class InvalidIFSCCodeFailure extends IFSCCodeFailure {
  @override
  String get message => 'Invalid IFSC Code Number';
}

const ifscRegExp = r'^([A-Z]{4})(0)(([A-Z]|[0-9]){6})$';

class IFSCCode {
  final String? value;

  const IFSCCode._(this.value);

  static Either<IFSCCodeFailure, IFSCCode> create(String? ifscCode) {
    if (ifscCode != null) {
      final match = RegExp(ifscRegExp).firstMatch(ifscCode);
      if (match == null) return left(InvalidIFSCCodeFailure());
      return right(IFSCCode._(ifscCode));
    }
    return right(IFSCCode._(ifscCode));
  }
}

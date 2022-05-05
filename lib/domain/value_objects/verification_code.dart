import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class VerificationCodeFailure extends Failure {}

class EmptyVerificationCodeFailure extends VerificationCodeFailure {
  @override
  String get message => "Verification code is required";
}

class InvalidVerificationCodeLengthFailure extends VerificationCodeFailure {
  @override
  String get message => "Verification code must be 6 digits long";
}

class InvalidVerificationCodeFailure extends VerificationCodeFailure {
  @override
  String get message => "Invalid Verification code";
}

class VerificationCode {
  final int value;

  VerificationCode._(this.value);

  static Either<VerificationCodeFailure, VerificationCode> createFromString(
      String code) {
    if (code.isEmpty) return left(EmptyVerificationCodeFailure());
    final verificationCode = int.tryParse(code);
    if (verificationCode == null) return left(InvalidVerificationCodeFailure());
    if (code.length != 6) return left(InvalidVerificationCodeLengthFailure());
    return right(VerificationCode._(verificationCode));
  }
}

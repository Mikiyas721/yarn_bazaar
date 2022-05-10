import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class OtherUserTypeFailure extends Failure {}

class EmptyOtherUserTypeFailure extends OtherUserTypeFailure {
  @override
  String get message => 'User type is required';
}

class ShortOtherUserType extends OtherUserTypeFailure {
  @override
  String get message => 'User type too short';
}

class LongOtherUserType extends OtherUserTypeFailure {
  @override
  String get message => 'User type too long';
}

class OtherUserType {
  final String value;

  OtherUserType._(this.value);

  static Either<OtherUserTypeFailure, OtherUserType> create(String userType) {
    if (userType.isEmpty) return left(EmptyOtherUserTypeFailure());
    if (userType.length < 2) return left(ShortOtherUserType());
    if (userType.length > 20) return left(LongOtherUserType());
    return right(OtherUserType._(userType));
  }
}

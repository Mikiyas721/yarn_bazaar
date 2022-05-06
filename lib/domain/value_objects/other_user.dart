import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class UserTypeFailure extends Failure {}

class EmptyUserTypeFailure extends UserTypeFailure {
  @override
  String get message => 'User type is required';
}

class UserType {
  final String value;

  UserType._(this.value);

  static Either<UserTypeFailure, UserType> create(String userType) {
    if (userType.isEmpty) return left(EmptyUserTypeFailure());
    return right(UserType._(userType));
  }
}

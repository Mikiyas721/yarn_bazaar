import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class PasswordFailure extends Failure {}

class EmptyPasswordFailure extends PasswordFailure {
  @override
  String get message => 'Password is required';
}

class ShortPasswordFailure extends PasswordFailure {
  @override
  String get message => 'Password has to be at least 6 characters long';
}

class LongPasswordFailure extends PasswordFailure {
  @override
  String get message => 'Password can not be more than 15 characters long';
}

class WeakPasswordFailure extends PasswordFailure {
  @override
  String get message =>
      'Weak password. Your password should contain Lowercase, Uppercase, Number and special character.';
}

const passwordRegExp = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6}$';

class Password {
  final String value;

  Password._(this.value);

  static Either<PasswordFailure, Password> create(String password) {
    if (password.isEmpty) return left(EmptyPasswordFailure());
    if (password.length < 6) return left(ShortPasswordFailure());
    if (password.length > 15) return left(LongPasswordFailure());
    final matchedPassword = RegExp(passwordRegExp).firstMatch(password);
    if (matchedPassword == null) return left(WeakPasswordFailure());
    return right(Password._(password));
  }
}

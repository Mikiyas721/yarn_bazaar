import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class EmailFailure extends Failure {}

class InvalidEmailFailure extends EmailFailure {
  @override
  String get message => 'Invalid Email';
}

const emailRegExp = r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$';

class Email{
  final String? value;

  Email._(this.value);

  static Either<EmailFailure, Email> create(String? email){
    if(email==null) return right(Email._(email));
    final matched = RegExp(emailRegExp).firstMatch(email);
    if (matched == null) return left(InvalidEmailFailure());
    return right(Email._(email));
  }
}
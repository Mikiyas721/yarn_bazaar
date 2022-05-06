import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class AccountNumberFailure extends Failure {}

class InvalidAccountNumberFailure extends AccountNumberFailure {
  @override
  String get message => 'Invalid Account Number';
}

class ShortAccountNumberFailure extends AccountNumberFailure {
  @override
  String get message => 'Account Number is too short';
}

class LongAccountNumberFailure extends AccountNumberFailure {
  @override
  String get message => 'Account Number is too short';
}

const accountNumberRegExp = r'^[0-9]{9,18}&';


class AccountNumber {
  final String? value;

  const AccountNumber._(this.value);

  static Either<AccountNumberFailure, AccountNumber> create(String? accountNumber) {
    if (accountNumber != null) {
      final parsedAccountNumber = RegExp(accountNumberRegExp).firstMatch(accountNumber);
      if (parsedAccountNumber==null) return left(InvalidAccountNumberFailure());
      if (accountNumber.length<9) return left(ShortAccountNumberFailure());
      if (accountNumber.length>18) return left(LongAccountNumberFailure());
      return right(AccountNumber._(accountNumber));
    }
    return right(const AccountNumber._(null));
  }
}

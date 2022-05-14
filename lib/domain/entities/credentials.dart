import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/entity.dart';
import 'package:yarn_bazaar/domain/value_objects/password.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';

class Credentials extends Entity {
  final PhoneNumber phoneNumber;
  final Password password;

  Credentials._({
    required this.phoneNumber,
    required this.password,
  }) : super(null);

  static Option<Credentials> create({String? phoneNumber, String? password}) {
    if ([phoneNumber, password].any((element) => element == null)) return none();
    final phoneNumberObject = PhoneNumber.create(phoneNumber!);
    final passwordObject = Password.create(password!);
    if (phoneNumberObject.isLeft() || passwordObject.isLeft()) return none();
    return some(Credentials._(
      phoneNumber: phoneNumberObject.getOrElse(() => throw Exception('Phone number Error')),
      password: passwordObject.getOrElse(() => throw Exception('Password Error')),
    ));
  }
}

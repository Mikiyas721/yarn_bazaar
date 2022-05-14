import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';

abstract class IFirebaseRepo{
  Future<PhoneAuthResult> requestCode(PhoneNumber phoneNumber);
  Future<Either<Failure, String>> verifyCode(String verificationCode);
}

abstract class PhoneAuthResult {}
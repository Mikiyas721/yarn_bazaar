import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/ports/firebase_repo.dart';

@lazySingleton
class VerifyFirebasePhoneAuthCode{
  final IFirebaseRepo _firebaseRepo;

  VerifyFirebasePhoneAuthCode(this._firebaseRepo);
  Future<Either<Failure, String>>execute(String verificationCode){
    return _firebaseRepo.verifyCode(verificationCode);
  }
}
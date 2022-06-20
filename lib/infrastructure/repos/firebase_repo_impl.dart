import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/ports/firebase_repo.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';

@LazySingleton(as: IFirebaseRepo)
class FireBaseRepo extends IFirebaseRepo {
  final firebaseAuthInstance = FirebaseAuth.instance;
  String verificationId = '';

  @override
  Future<PhoneAuthResult> requestCode(PhoneNumber phoneNumber) async {
    Completer<PhoneAuthResult> verificationCompleter = Completer();
    firebaseAuthInstance.verifyPhoneNumber(
        timeout: Duration(seconds: 15),
        phoneNumber: phoneNumber.value,
        codeSent: (String verification, int? forceResend) {
          verificationId = verification;
        },
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          UserCredential result =
              await firebaseAuthInstance.signInWithCredential(authCredential);
          final idToken = await result.user?.getIdToken();
          if (idToken == null)
            verificationCompleter.complete(PhoneAuthFailedResult('Unable to authenticate'));
          else
            verificationCompleter.complete(PhoneAuthSuccessResult(idToken));
        },
        verificationFailed: (FirebaseAuthException exception) {
          verificationCompleter
              .complete(PhoneAuthFailedResult('${exception.code}: ${exception.message}'));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCompleter.complete(PhoneAuthTimeoutResult(verificationId));
        });
    return await verificationCompleter.future;
  }

  @override
  Future<Either<Failure, String>> verifyCode(String verificationCode) async {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
    UserCredential result = await firebaseAuthInstance.signInWithCredential(credential);
    final idToken = await result.user?.getIdToken();
    if (idToken == null) return left(SimpleFailure('Unable to authenticate'));
    return right(idToken);
  }
}

class PhoneAuthTimeoutResult implements PhoneAuthResult {
  final String verificationCode;

  PhoneAuthTimeoutResult(this.verificationCode);
}

class PhoneAuthSuccessResult implements PhoneAuthResult {
  final String? token;

  PhoneAuthSuccessResult(this.token);
}

class PhoneAuthFailedResult implements PhoneAuthResult {
  final String failureMessage;

  PhoneAuthFailedResult(this.failureMessage);
}

import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/domain/ports/firebase_repo.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';

@lazySingleton
class RequestFirebasePhoneAuthCode {
  final IFirebaseRepo _firebaseRepo;

  RequestFirebasePhoneAuthCode(this._firebaseRepo);

  Future<PhoneAuthResult> execute(PhoneNumber phoneNumber) {
    return _firebaseRepo.requestCode(phoneNumber);
  }
}

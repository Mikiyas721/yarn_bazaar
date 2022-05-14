import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';

@lazySingleton
class CheckPhoneNumber {
  final IUserRepo _iUserRepo;

  CheckPhoneNumber(this._iUserRepo);

  Future<Either<Failure, bool>> execute(PhoneNumber phoneNumber) async{
    return _iUserRepo.checkPhoneNumberExists(phoneNumber.value);
  }
}

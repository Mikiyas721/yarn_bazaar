import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/ports/bank_details_repo.dart';

@lazySingleton
class FetchSavedUserBankDetails{
  final IBankDetailsRepo _iBankDetailsRepo;

  FetchSavedUserBankDetails(this._iBankDetailsRepo);

  Future<Either<Failure, BankDetail>> execute(String userId){
    return _iBankDetailsRepo.fetchUserBankDetails(userId);
  }

}
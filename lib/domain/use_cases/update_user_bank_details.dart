import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/ports/bank_detail_repo.dart';

@injectable
class UpdateUserBankDetails {
  final IBankDetailRepo _iBankDetails;

  UpdateUserBankDetails(this._iBankDetails);

  Future<Either<Failure, BankDetails>> execute(String userId,
      BankDetails bankDetails) {
    return _iBankDetails.updateUserBankDetails(userId, bankDetails);
  }
}
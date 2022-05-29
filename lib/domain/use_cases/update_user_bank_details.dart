import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/ports/bank_details_repo.dart';

@injectable
class UpdateUserBankDetail {
  final IBankDetailsRepo _iBankDetails;

  UpdateUserBankDetail(this._iBankDetails);

  Future<Either<Failure, BankDetail>> execute(BankDetail bankDetails) {
    return _iBankDetails.updateUserBankDetail(bankDetails);
  }
}

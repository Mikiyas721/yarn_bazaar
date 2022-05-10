import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/ports/bank_details_repo.dart';

@injectable
class UpdateUserBankDetails {
  final IBankDetailsRepo _iBankDetails;

  UpdateUserBankDetails(this._iBankDetails);

  Future<Either<Failure, BankDetails>> execute(BankDetails bankDetails) {
    return _iBankDetails.updateUserBankDetails(bankDetails);
  }
}

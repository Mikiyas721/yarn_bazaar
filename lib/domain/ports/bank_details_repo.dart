import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';

abstract class IBankDetailsRepo{
  Future<Either<Failure, BankDetail>> fetchUserBankDetails(String userId);
  Future<Either<Failure, BankDetail>> updateUserBankDetail(BankDetail newBankDetails);
}
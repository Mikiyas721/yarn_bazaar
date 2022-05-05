import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';

abstract class IBankDetailRepo{
  Future<Either<Failure, BankDetails>> fetchUserBankDetails(String userId);
  Future<Either<Failure, BankDetails>> updateUserBankDetails(String userId, BankDetails newBankDetails);
}
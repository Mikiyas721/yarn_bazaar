import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';

abstract class IBusinessDetailRepo{
  Future<Either<Failure, BusinessDetails>> fetchUserBusinessDetails(String userId);
  Future<Either<Failure, BusinessDetails>> updateUserBusinessDetails(String userId, BusinessDetails newBankDetails);
}
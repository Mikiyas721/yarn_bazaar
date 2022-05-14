import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';

abstract class IBusinessDetailsRepo{
  Future<Either<Failure, BusinessDetail>> fetchUserBusinessDetails(String userId);
  Future<Either<Failure, BusinessDetail>> updateUserBusinessDetails(BusinessDetail newBankDetails);
}
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/ports/business_details_repo.dart';

@lazySingleton
class FetchSavedUserBusinessDetails{
  final IBusinessDetailsRepo _iBusinessDetailsRepo;

  FetchSavedUserBusinessDetails(this._iBusinessDetailsRepo);

  Future<Either<Failure, BusinessDetails>> execute(String userId){
    return _iBusinessDetailsRepo.fetchUserBusinessDetails(userId);
  }

}
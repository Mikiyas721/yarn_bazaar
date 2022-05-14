import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/ports/business_details_repo.dart';

@lazySingleton
class UpdateUserBusinessDetails {
  final IBusinessDetailsRepo _iBusinessDetailRepo;

  UpdateUserBusinessDetails(this._iBusinessDetailRepo);

  Future<Either<Failure, BusinessDetail>> execute(BusinessDetail businessDetails) {
    return _iBusinessDetailRepo.updateUserBusinessDetails(businessDetails);
  }
}

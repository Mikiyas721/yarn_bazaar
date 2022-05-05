import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/ports/business_detail_repo.dart';

@injectable
class UpdateUserBusinessDetails {
  final IBusinessDetailRepo _iBusinessDetailRepo;

  UpdateUserBusinessDetails(this._iBusinessDetailRepo);

  Future<Either<Failure, BusinessDetails>> execute(
      String userId, BusinessDetails businessDetails) {
    return _iBusinessDetailRepo.updateUserBusinessDetails(userId, businessDetails);
  }
}

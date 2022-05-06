import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/ports/business_details_repo.dart';
import 'package:yarn_bazaar/infrastructure/datasources/business_details_datasource.dart';
import 'package:yarn_bazaar/infrastructure/dtos/business_details_dto.dart';

@LazySingleton(as: IBusinessDetailsRepo)
class BusinessDetailsRepoImpl extends IBusinessDetailsRepo {
  final BusinessDetailsCrudDatasource _businessDetailsCrudDatasource;

  final businessDetailsDtoMappingSimpleFailure = const SimpleFailure(
      'Unable to map business details json from API to Domain');

  BusinessDetailsRepoImpl(this._businessDetailsCrudDatasource);

  @override
  Future<Either<Failure, BusinessDetails>> fetchUserBusinessDetails(
      String userId) async {
    final result = await _businessDetailsCrudDatasource.find(options: {
      "filter": {
        "where": {"userId": userId}
      }
    });
    return result.fold(
      (l) => left(l),
      (r) => right(
          IdDto.toDomainList<BusinessDetails, BusinessDetailsDto>(r).first),
    );
  }

  @override
  Future<Either<Failure, BusinessDetails>> updateUserBusinessDetails(
      String userId, BusinessDetails newBankDetails) {
    // TODO: implement updateUserBusinessDetails
    throw UnimplementedError();
  }
}

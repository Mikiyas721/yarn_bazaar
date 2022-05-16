import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/ports/bank_details_repo.dart';
import 'package:yarn_bazaar/infrastructure/datasources/bank_details_datasource.dart';
import 'package:yarn_bazaar/infrastructure/dtos/bank_detail_dto.dart';

@LazySingleton(as: IBankDetailsRepo)
class BankDetailsRepoImpl extends IBankDetailsRepo {
  final BankDetailsCrudDatasource _bankDetailsCrudDatasource;

  BankDetailsRepoImpl(this._bankDetailsCrudDatasource);

  final bankDtoMappingSimpleFailure =
      const SimpleFailure('Unable to map bank details json from API to Domain');

  @override
  Future<Either<Failure, BankDetail>> fetchUserBankDetails(String userId) async {
    final result = await _bankDetailsCrudDatasource.find(options: {
      "filter": {
        "where": {"userId": userId}
      }
    });
    return result.fold(
      (l) => left(l),
      (r) => right(IdDto.toDomainList<BankDetail, BankDetailDto>(r)!.first),
    );
  }

  @override
  Future<Either<Failure, BankDetail>> updateUserBankDetails(BankDetail newBankDetails) async {
    final result =
        await _bankDetailsCrudDatasource.update(BankDetailDto.fromDomain(newBankDetails));
    return result.fold(
      (l) => left(l),
      (r) => r.toDomain().fold(() => left(bankDtoMappingSimpleFailure), (a) => right(a)),
    );
  }
}

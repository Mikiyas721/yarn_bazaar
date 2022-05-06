import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';
import 'package:yarn_bazaar/domain/ports/yarn_repo.dart';
import 'package:yarn_bazaar/infrastructure/datasources/yarn_datasource.dart';
import 'package:yarn_bazaar/infrastructure/dtos/yarn_dto.dart';

@LazySingleton(as: IYarnRepo)
class YarnRepoImpl extends IYarnRepo {
  final YarnCrudDataSource _yarnCrudDataSource;

  final yarnDtoMappingSimpleFailure =
      const SimpleFailure('Unable to map yarn json from API to Domain');

  YarnRepoImpl(this._yarnCrudDataSource);

  @override
  Future<Either<Failure, Yarn>> create(Yarn yarn) async {
    final result = await _yarnCrudDataSource.create(YarnDto.fromDomain(yarn));
    return result.fold(
      (l) => left(l),
      (r) => r.toDomain().fold(
            () => left(yarnDtoMappingSimpleFailure),
            (a) => right(a),
          ),
    );
  }

  @override
  Future<Either<Failure, List<Yarn>>> fetchAll(String currentUserId) async {
    final result = await _yarnCrudDataSource.find();
    return result.fold(
      (l) => left(l),
      (r) => right(IdDto.toDomainList<Yarn, YarnDto>(r)),
    );
  }

  @override
  Future<Either<Failure, List<Yarn>>> fetchByCategory(
      String currentUserId, String category) async {
    final result = await _yarnCrudDataSource.find(options: {
      "filter": {
        "where": {
          "and": [
            {
              "userId": {"ne": currentUserId}
            },
            {"yarnType": category}
          ]
        }
      }
    });
    return result.fold(
      (l) => left(l),
      (r) => right(IdDto.toDomainList<Yarn, YarnDto>(r)),
    );
  }

  @override
  Future<Either<Failure, List<Yarn>>> fetchByUserId(String userId) async {
    final result = await _yarnCrudDataSource.find(options: {
      "filter": {
        "where": {"userId": userId}
      }
    });
    return result.fold(
      (l) => left(l),
      (r) => right(IdDto.toDomainList<Yarn, YarnDto>(r)),
    );
  }

  @override
  Future<Either<Failure, Yarn>> updateYarn(Yarn yarn) async {
    final result = await _yarnCrudDataSource.update(YarnDto.fromDomain(yarn));
    return result.either.fold(
      (l) => left(l),
      (r) => r.toDomain().fold(
            () => left(yarnDtoMappingSimpleFailure),
            (a) => right(a),
          ),
    );
  }
}

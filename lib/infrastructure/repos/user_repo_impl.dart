import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';
import 'package:yarn_bazaar/infrastructure/datasources/user_cache_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/user_datasource.dart';
import 'package:yarn_bazaar/infrastructure/dtos/user_dto.dart';

@LazySingleton(as: IUserRepo)
class UserRepoImpl extends IUserRepo {
  final UserCrudDatasource _userCrudDatasource;
  final UserCacheDataSource _userCacheDataSource;

  final userDtoMappingSimpleFailure =
      const SimpleFailure('Unable to map user json from API to Domain');

  UserRepoImpl(this._userCrudDatasource, this._userCacheDataSource);

  @override
  Future<bool> clearLoggedInUser() {
    return _userCacheDataSource.clear();
  }

  @override
  Future<Either<Failure, User>> create(User user) async {
    final result = await _userCrudDatasource.create(UserDto.fromDomain(user));
    return result.fold(
      (l) => left(l),
      (r) => r.toDomain().fold(
            () => left(userDtoMappingSimpleFailure),
            (a) => right(a),
          ),
    );
  }

  @override
  Future<Either<Failure, List<User>>> fetchAll(String currentUserId) async {
    final result = await _userCrudDatasource.find();
    return result.fold(
      (l) => left(l),
      (r) => right(IdDto.toDomainList<User, UserDto>(r)),
    );
  }

  @override
  Future<Either<Failure, User>> fetchById(String id) async {
    final result = await _userCrudDatasource.findById(id);
    return result.fold(
      (l) => left(l),
      (r) => r
          .toDomain()
          .fold(() => left(userDtoMappingSimpleFailure), (a) => right(a)),
    );
  }

  @override
  Future<Either<Failure, List<User>>> fetchByUserType(
      String currentUserId, String userType) async {
    final result = await _userCrudDatasource.find(options: {
      "filter": {
        "where": {
          "and": [
            {
              "id": {"ne": currentUserId}
            },
            {"userType": userType}
          ]
        }
      }
    });
    return result.fold(
      (l) => left(l),
      (r) => right(IdDto.toDomainList<User, UserDto>(r)),
    );
  }

  @override
  Future<Option<User>> getCurrentLoggedInUser() {
    return _userCacheDataSource.getMap(_userCacheDataSource.userCacheKey).then(
        (value) => value.flatMap(
            (a) => UserDto.fromJson(a as Map<String, dynamic>).toDomain()));
  }

  @override
  Future saveLoggedInUser(User user) {
    return _userCacheDataSource.saveMap(
      _userCacheDataSource.userCacheKey,
      UserDto.fromDomain(user).toJson(),
    );
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    final result = await _userCrudDatasource.update(UserDto.fromDomain(user));
    return result.either.fold(
      (l) => left(l),
      (r) => r.toDomain().fold(
            () => left(userDtoMappingSimpleFailure),
            (a) => right(a),
          ),
    );
  }
}

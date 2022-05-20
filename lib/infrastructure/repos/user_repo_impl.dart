import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/common/id_dto.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/entities/credentials.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/ports/user_repo.dart';
import 'package:yarn_bazaar/infrastructure/datasources/user_cache_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/user_remote_datasource.dart';
import 'package:yarn_bazaar/infrastructure/dtos/app_user_dto.dart';
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
      (r) => right(IdDto.toDomainList<User, UserDto>(r)!),
    );
  }

  @override
  Future<Either<Failure, User>> fetchById(String id) async {
    final result = await _userCrudDatasource.findById(id);
    return result.fold(
      (l) => left(l),
      (r) => r.toDomain().fold(() => left(userDtoMappingSimpleFailure), (a) => right(a)),
    );
  }

  @override
  Future<Either<Failure, List<User>>> fetchByUserType(
      String currentUserId, String? userType) async {
    final options = userType == null
        ? {
            "filter": {
              "where": {
                "id": {"ne": "$currentUserId"}
              },
              "include": [
                {"relation": "bankDetail"},
                {"relation": "businessDetail"},
                {"relation": "yarns"}
              ]
            },
          }
        : {
            "filter": {
              "where": {
                "and": [
                  {
                    "id": {"ne": "$currentUserId"}
                  },
                  {"userType": "$userType"}
                ]
              },
              "include": [
                {"relation": "bankDetail"},
                {"relation": "businessDetail"},
                {"relation": "yarns"}
              ]
            },
          };
    final result = await _userCrudDatasource.find(options: options);
    return result.fold(
      (l) => left(l),
      (r) {
        final userList = IdDto.toDomainList<User, UserDto>(r);
        if (userList == null) return left(userDtoMappingSimpleFailure);
        return right(userList);
      },
    );
  }

  @override
  Future<Option<AppUser>> getCurrentLoggedInUser() {
    return _userCacheDataSource.getMap(_userCacheDataSource.userCacheKey).then((value) =>
        value.flatMap((a) => AppUserDto.fromJson(a as Map<String, dynamic>).toDomain()));
  }

  @override
  Future<bool> cacheLoggedInUser(AppUser user) {
    return _userCacheDataSource.saveMap(
      _userCacheDataSource.userCacheKey,
      AppUserDto.fromDomain(user).toJson(),
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

  @override
  Future<Either<Failure, AppUser>> signInUser(Credentials credentials) {
    return _userCrudDatasource.signIn(credentials);
  }

  @override
  Future<Either<Failure, AppUser>> addUser(AppUser appUser) {
    return _userCrudDatasource.addUser(appUser);
  }

  Future<Either<Failure, bool>> checkPhoneNumberExists(String phoneNumber) async {
    return _userCrudDatasource.checkPhoneNumber(phoneNumber);
  }
}

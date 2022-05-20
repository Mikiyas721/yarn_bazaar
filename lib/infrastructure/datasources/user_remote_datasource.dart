import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/entities/credentials.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/rest_crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_request.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_response.dart';
import 'package:yarn_bazaar/infrastructure/dtos/app_user_dto.dart';
import 'package:yarn_bazaar/infrastructure/dtos/credentials_dto.dart';
import 'package:yarn_bazaar/infrastructure/dtos/user_dto.dart';

abstract class UserCrudDatasource extends CrudDataSource<UserDto, RestResponseFailure> {
  Future<Either<Failure, AppUser>> signIn(Credentials credentials);

  Future<Either<Failure, AppUser>> addUser(AppUser user);

  Future<Either<Failure, bool>> checkPhoneNumber(String phoneNumber);
}

@LazySingleton(as: UserCrudDatasource)
class UserLoopbackDatasource extends LoopbackRestCrudDataSource<UserDto>
    implements UserCrudDatasource {
  UserLoopbackDatasource(RestDataSource restDataSource)
      : super(
          '/users',
          restDataSource,
          (user) => user.toJson(),
          (map) => UserDto.fromJson(map),
        );

  @override
  Future<Either<Failure, AppUser>> addUser(AppUser user) async {
    final result = await restDataSource.post(RestRequest(
      url: '$path/addUser',
      data: AppUserDto.fromDomain(user).toJson(),
    ));

    return result.either.fold(
      (l) => left(l),
      (r) => AppUserDto.fromJson(r.value)
          .toDomain()
          .fold(() => left(SimpleFailure("Unable to map to Domain")), (a) => right(a)),
    );
  }

  @override
  Future<Either<Failure, AppUser>> signIn(Credentials credentials) async {
    final result = await restDataSource.post(RestRequest(
      url: '$path/signIn',
      data: CredentialsDto.fromDomain(credentials).toJson(),
    ));

    return result.either.fold((l) => left(l), (r) {
      final result = AppUserDto.fromJson(r.value);
      return result
          .toDomain()
          .fold(() => left(SimpleFailure("Unable to map to Domain")), (a) => right(a));
    });
  }

  @override
  Future<Either<Failure, bool>> checkPhoneNumber(String phoneNumber) async{
    final phoneNumberExistsResponse = await restDataSource.post(RestRequest(
      url: '$path/checkPhoneNumber/$phoneNumber'
    ));
    return phoneNumberExistsResponse.either.fold((l) => left(l), (r) => right(r.value));
  }


}

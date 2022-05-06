import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/rest_crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_response.dart';
import 'package:yarn_bazaar/infrastructure/dtos/user_dto.dart';

abstract class UserCrudDatasource
    extends CrudDataSource<UserDto, RestResponseFailure> {}

@LazySingleton(as: UserCrudDatasource)
class UserLoopbackDatasource extends LoopbackRestCrudDataSource<UserDto>
    implements UserCrudDatasource {
  UserLoopbackDatasource(RestDataSource restDataSource)
      : super(
          '/users',
          restDataSource,
          (yarn) => yarn.toJson(),
          (map) => UserDto.fromJson(map),
        );
}

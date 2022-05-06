import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/rest_crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_response.dart';
import 'package:yarn_bazaar/infrastructure/dtos/yarn_dto.dart';

abstract class YarnCrudDataSource
    extends CrudDataSource<YarnDto, RestResponseFailure> {}

@LazySingleton(as: YarnCrudDataSource)
class YarnLoopbackDatasource extends LoopbackRestCrudDataSource<YarnDto>
    implements YarnCrudDataSource {
  YarnLoopbackDatasource(RestDataSource restDataSource)
      : super(
          '/yarns',
          restDataSource,
          (yarn) => yarn.toJson(),
          (map) => YarnDto.fromJson(map),
        );
}

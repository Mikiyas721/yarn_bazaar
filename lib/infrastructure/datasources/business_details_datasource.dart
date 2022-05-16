import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/rest_crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_response.dart';
import 'package:yarn_bazaar/infrastructure/dtos/business_detail_dto.dart';

abstract class BusinessDetailsCrudDatasource
    extends CrudDataSource<BusinessDetailDto, RestResponseFailure> {}

@LazySingleton(as: BusinessDetailsCrudDatasource)
class BusinessDetailsLoopbackDatasource
    extends LoopbackRestCrudDataSource<BusinessDetailDto>
    implements BusinessDetailsCrudDatasource {
  BusinessDetailsLoopbackDatasource(RestDataSource restDataSource)
      : super(
          '/businessDetails',
          restDataSource,
          (yarn) => yarn.toJson(),
          (map) => BusinessDetailDto.fromJson(map),
        );
}

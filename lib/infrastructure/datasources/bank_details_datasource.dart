import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/rest_crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_response.dart';
import 'package:yarn_bazaar/infrastructure/dtos/bank_detail_dto.dart';

abstract class BankDetailsCrudDatasource
    extends CrudDataSource<BankDetailDto, RestResponseFailure> {}

@LazySingleton(as: BankDetailsCrudDatasource)
class BankDetailsLoopbackDatasource
    extends LoopbackRestCrudDataSource<BankDetailDto>
    implements BankDetailsCrudDatasource {
  BankDetailsLoopbackDatasource(RestDataSource restDataSource)
      : super(
          '/bankDetails',
          restDataSource,
          (yarn) => yarn.toJson(),
          (map) => BankDetailDto.fromJson(map),
        );
}

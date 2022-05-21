import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/crud_datasource/rest_crud_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_datasource.dart';
import 'package:yarn_bazaar/infrastructure/datasources/shared/rest_datasource/rest_response.dart';
import 'package:yarn_bazaar/infrastructure/dtos/suggestion_dto.dart';

abstract class SuggestionCrudDatasource
    extends CrudDataSource<SuggestionDto, RestResponseFailure> {}

@LazySingleton(as: SuggestionCrudDatasource)
class SuggestionLoopbackDatasource extends LoopbackRestCrudDataSource<SuggestionDto>
    implements SuggestionCrudDatasource {
  SuggestionLoopbackDatasource(RestDataSource restDataSource)
      : super(
          '/suggestions',
          restDataSource,
          (suggestionDto) => suggestionDto.toJson(),
          (map) => SuggestionDto.fromJson(map),
        );
}

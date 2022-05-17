import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/suggestion.dart';
import 'package:yarn_bazaar/domain/ports/suggestion_repo.dart';
import 'package:yarn_bazaar/infrastructure/datasources/suggestion_datasource.dart';
import 'package:yarn_bazaar/infrastructure/dtos/suggestion_dto.dart';

@LazySingleton(as: ISuggestionRepo)
class SuggestionRepoImpl extends ISuggestionRepo {
  final SuggestionDatasourceCrudDatasource _suggestionDatasourceCrudDatasource;
  final suggestionDtoMappingSimpleFailure =
      const SimpleFailure('Unable to map suggestion json from API to Domain');

  SuggestionRepoImpl(this._suggestionDatasourceCrudDatasource);

  @override
  Future<Either<Failure, Suggestion>> create(Suggestion suggestion) async {
    final result =
        await _suggestionDatasourceCrudDatasource.create(SuggestionDto.fromDomain(suggestion));
    return result.fold(
      (l) => left(l),
      (r) => r.toDomain().fold(
            () => left(suggestionDtoMappingSimpleFailure),
            (a) => right(a),
          ),
    );
  }
}

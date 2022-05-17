import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/suggestion.dart';
import 'package:yarn_bazaar/domain/ports/suggestion_repo.dart';

@lazySingleton
class AddSuggestion{
  final ISuggestionRepo _iSuggestionRepo;

  AddSuggestion(this._iSuggestionRepo);

  Future<Either<Failure, Suggestion>> execute(Suggestion suggestion){
    return _iSuggestionRepo.create(suggestion);
  }
}
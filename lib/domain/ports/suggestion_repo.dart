import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/suggestion.dart';

abstract class ISuggestionRepo{
  Future<Either<Failure,Suggestion>> create(Suggestion suggestion);
}
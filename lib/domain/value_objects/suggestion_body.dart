import 'package:dartz/dartz.dart';
import 'package:yarn_bazaar/common/failure.dart';

abstract class SuggestionBodyFailure extends Failure {}

class EmptySuggestionBodyFailure extends SuggestionBodyFailure {
  @override
  String get message => "SuggestionBody is required";
}

class ShortSuggestionBodyFailure extends SuggestionBodyFailure {
  @override
  String get message => "SuggestionBody is too short";
}

class SuggestionBody {
  final String value;

  SuggestionBody._(this.value);

  static Either<SuggestionBodyFailure, SuggestionBody> create(String suggestionBody) {
    if (suggestionBody.isEmpty) return left(EmptySuggestionBodyFailure());
    if (suggestionBody.split(' ').length < 3) return left(ShortSuggestionBodyFailure());
    return right(SuggestionBody._(suggestionBody));
  }
}

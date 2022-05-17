part of 'suggestion_bloc.dart';

@freezed
abstract class SuggestionState extends BlocState with _$SuggestionState {
  const factory SuggestionState({
    required Option<SuggestionType> suggestionType,
    required Either<SuggestionBodyFailure, SuggestionBody> suggestionBody,
    required bool hasSubmitted,
    required bool isAddingSuggestion,
  }) = _SuggestionState;

  factory SuggestionState.initial() => SuggestionState(
        suggestionType: none(),
        suggestionBody: SuggestionBody.create(''),
        hasSubmitted: false,
        isAddingSuggestion: false,
      );
}

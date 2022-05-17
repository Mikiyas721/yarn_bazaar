part of 'suggestion_bloc.dart';

abstract class SuggestionEvent extends BlocEvent<SuggestionState> {}

class SuggestionTypeChangedEvent extends SuggestionEvent {
  final Option<SuggestionType> suggestionType;

  SuggestionTypeChangedEvent(this.suggestionType);

  @override
  SuggestionState handle(SuggestionState currentState) {
    return currentState.copyWith(suggestionType: suggestionType);
  }
}

class SuggestionBodyChangedEvent extends SuggestionEvent {
  final String suggestionBody;

  SuggestionBodyChangedEvent(this.suggestionBody);

  @override
  SuggestionState handle(SuggestionState currentState) {
    return currentState.copyWith(suggestionBody: SuggestionBody.create(suggestionBody));
  }
}

class SuggestionHasSubmittedEvent extends SuggestionEvent {
  @override
  SuggestionState handle(SuggestionState currentState) {
    return currentState.copyWith(hasSubmitted: true);
  }
}

class SuggestionStartedAddingSuggestionEvent extends SuggestionEvent {
  @override
  SuggestionState handle(SuggestionState currentState) {
    return currentState.copyWith(isAddingSuggestion: true);
  }
}

class SuggestionStoppedAddingSuggestionEvent extends SuggestionEvent {
  @override
  SuggestionState handle(SuggestionState currentState) {
    return currentState.copyWith(isAddingSuggestion: false);
  }
}

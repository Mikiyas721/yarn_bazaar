part of 'fetch_similar_yarns_bloc.dart';

abstract class FetchSimilarYarnsEvent extends BlocEvent<FetchSimilarYarnsState> {}

class FetchSimilarYarnsDataChangedEvent extends FetchSimilarYarnsEvent {
  final List<Yarn> yarns;

  FetchSimilarYarnsDataChangedEvent(this.yarns);

  @override
  FetchSimilarYarnsState handle(FetchSimilarYarnsState currentState) {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchSimilarYarnsStartedLoadingEvent extends FetchSimilarYarnsEvent {
  @override
  FetchSimilarYarnsState handle(FetchSimilarYarnsState currentState) {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchSimilarYarnsStoppedLoadingEvent extends FetchSimilarYarnsEvent {
  @override
  FetchSimilarYarnsState handle(FetchSimilarYarnsState currentState) {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchSimilarYarnsLoadFailureEvent extends FetchSimilarYarnsEvent {
  final Option<Failure> failure;

  FetchSimilarYarnsLoadFailureEvent(this.failure);

  @override
  FetchSimilarYarnsState handle(FetchSimilarYarnsState currentState) {
    return currentState.copyWith(error: failure);
  }
}

class FetchSimilarYarnsExpandedIndexChangedEvent extends FetchSimilarYarnsEvent {
  final int newIndex;

  FetchSimilarYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchSimilarYarnsState handle(FetchSimilarYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

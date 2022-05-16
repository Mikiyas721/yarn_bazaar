part of 'fetch_cotton_yarns_bloc.dart';

abstract class FetchCottonYarnsEvent extends BlocEvent<FetchCottonYarnsState> {}

class FetchCottonYarnsDataChangedEvent extends FetchCottonYarnsEvent {
  final List<Yarn> yarns;

  FetchCottonYarnsDataChangedEvent(this.yarns);

  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState) {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchCottonYarnsStartedLoadingEvent extends FetchCottonYarnsEvent {
  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState) {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchCottonYarnsStoppedLoadingEvent extends FetchCottonYarnsEvent {
  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState) {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchCottonYarnsLoadFailureEvent extends FetchCottonYarnsEvent {
  final Option<Failure> failure;

  FetchCottonYarnsLoadFailureEvent(this.failure);

  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState) {
    return currentState.copyWith(error: failure);
  }
}

class FetchCottonYarnsExpandedIndexChangedEvent extends FetchCottonYarnsEvent{
  final int newIndex;

  FetchCottonYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}
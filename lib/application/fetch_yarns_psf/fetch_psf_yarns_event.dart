part of 'fetch_psf_yarns_bloc.dart';

abstract class FetchPsfYarnsEvent extends BlocEvent<FetchPsfYarnsState> {}

class FetchPsfYarnsDataChangedEvent extends FetchPsfYarnsEvent {
  final List<Yarn> yarns;

  FetchPsfYarnsDataChangedEvent(this.yarns);

  @override
  FetchPsfYarnsState handle(FetchPsfYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchPsfYarnsStartedLoadingEvent extends FetchPsfYarnsEvent {
  @override
  FetchPsfYarnsState handle(FetchPsfYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchPsfYarnsStoppedLoadingEvent extends FetchPsfYarnsEvent {
  @override
  FetchPsfYarnsState handle(FetchPsfYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchPsfYarnsLoadFailureEvent extends FetchPsfYarnsEvent {
  final Option<Failure> failure;

  FetchPsfYarnsLoadFailureEvent(this.failure);

  @override
  FetchPsfYarnsState handle(FetchPsfYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchPsfYarnsExpandedIndexChangedEvent extends FetchPsfYarnsEvent{
  final int newIndex;

  FetchPsfYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchPsfYarnsState handle(FetchPsfYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}
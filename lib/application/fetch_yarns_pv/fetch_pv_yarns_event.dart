part of 'fetch_pv_yarns_bloc.dart';

abstract class FetchPvYarnsEvent extends BlocEvent<FetchPvYarnsState> {}

class FetchPvYarnsDataChangedEvent extends FetchPvYarnsEvent {
  final List<Yarn> yarns;

  FetchPvYarnsDataChangedEvent(this.yarns);

  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchPvYarnsStartedLoadingEvent extends FetchPvYarnsEvent {
  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchPvYarnsStoppedLoadingEvent extends FetchPvYarnsEvent {
  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchPvYarnsLoadFailureEvent extends FetchPvYarnsEvent {
  final Option<Failure> failure;

  FetchPvYarnsLoadFailureEvent(this.failure);

  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchPvYarnsExpandedIndexChangedEvent extends FetchPvYarnsEvent{
  final int newIndex;

  FetchPvYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

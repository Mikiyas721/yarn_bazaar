part of 'fetch_all_yarns_bloc.dart';

abstract class FetchAllYarnsEvent extends BlocEvent<FetchAllYarnsState> {}

class FetchAllYarnsDataChangedEvent extends FetchAllYarnsEvent {
  final List<Yarn> yarns;

  FetchAllYarnsDataChangedEvent(this.yarns);

  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchAllYarnsStartedLoadingEvent extends FetchAllYarnsEvent {
  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchAllYarnsStoppedLoadingEvent extends FetchAllYarnsEvent {
  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchAllYarnsLoadFailureEvent extends FetchAllYarnsEvent {
  final Option<Failure> failure;

  FetchAllYarnsLoadFailureEvent(this.failure);

  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchAllYarnsExpandedIndexChangedEvent extends FetchAllYarnsEvent{
  final int newIndex;

  FetchAllYarnsExpandedIndexChangedEvent(this.newIndex);
  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}
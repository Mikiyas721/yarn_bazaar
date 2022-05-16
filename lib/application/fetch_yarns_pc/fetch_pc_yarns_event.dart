part of 'fetch_pc_yarns_bloc.dart';

abstract class FetchPcYarnsEvent extends BlocEvent<FetchPcYarnsState> {}

class FetchPcYarnsDataChangedEvent extends FetchPcYarnsEvent {
  final List<Yarn> yarns;

  FetchPcYarnsDataChangedEvent(this.yarns);

  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchPcYarnsStartedLoadingEvent extends FetchPcYarnsEvent {
  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchPcYarnsStoppedLoadingEvent extends FetchPcYarnsEvent {
  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchPcYarnsLoadFailureEvent extends FetchPcYarnsEvent {
  final Option<Failure> failure;

  FetchPcYarnsLoadFailureEvent(this.failure);

  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchPcYarnsExpandedIndexChangedEvent extends FetchPcYarnsEvent{
  final int newIndex;

  FetchPcYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

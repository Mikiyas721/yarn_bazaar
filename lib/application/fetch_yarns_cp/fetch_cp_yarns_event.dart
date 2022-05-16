part of 'fetch_cp_yarns_bloc.dart';

abstract class FetchCpYarnsEvent extends BlocEvent<FetchCpYarnsState> {}

class FetchCpYarnsDataChangedEvent extends FetchCpYarnsEvent {
  final List<Yarn> yarns;

  FetchCpYarnsDataChangedEvent(this.yarns);

  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchCpYarnsStartedLoadingEvent extends FetchCpYarnsEvent {
  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchCpYarnsStoppedLoadingEvent extends FetchCpYarnsEvent {
  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchCpYarnsLoadFailureEvent extends FetchCpYarnsEvent {
  final Option<Failure> failure;

  FetchCpYarnsLoadFailureEvent(this.failure);

  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchCpYarnsExpandedIndexChangedEvent extends FetchCpYarnsEvent{
  final int newIndex;

  FetchCpYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

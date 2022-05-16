part of 'fetch_modal_yarns_bloc.dart';

abstract class FetchModalYarnsEvent extends BlocEvent<FetchModalYarnsState> {}

class FetchModalYarnsDataChangedEvent extends FetchModalYarnsEvent {
  final List<Yarn> yarns;

  FetchModalYarnsDataChangedEvent(this.yarns);

  @override
  FetchModalYarnsState handle(FetchModalYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchModalYarnsStartedLoadingEvent extends FetchModalYarnsEvent {
  @override
  FetchModalYarnsState handle(FetchModalYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchModalYarnsStoppedLoadingEvent extends FetchModalYarnsEvent {
  @override
  FetchModalYarnsState handle(FetchModalYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchModalYarnsLoadFailureEvent extends FetchModalYarnsEvent {
  final Option<Failure> failure;

  FetchModalYarnsLoadFailureEvent(this.failure);

  @override
  FetchModalYarnsState handle(FetchModalYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchModalYarnsExpandedIndexChangedEvent extends FetchModalYarnsEvent{
  final int newIndex;

  FetchModalYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchModalYarnsState handle(FetchModalYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

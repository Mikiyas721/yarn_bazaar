part of 'fetch_fancy_yarns_bloc.dart';

abstract class FetchFancyYarnsEvent extends BlocEvent<FetchFancyYarnsState> {}

class FetchFancyYarnsDataChangedEvent extends FetchFancyYarnsEvent {
  final List<Yarn> yarns;

  FetchFancyYarnsDataChangedEvent(this.yarns);

  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchFancyYarnsStartedLoadingEvent extends FetchFancyYarnsEvent {
  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchFancyYarnsStoppedLoadingEvent extends FetchFancyYarnsEvent {
  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchFancyYarnsLoadFailureEvent extends FetchFancyYarnsEvent {
  final Option<Failure> failure;

  FetchFancyYarnsLoadFailureEvent(this.failure);

  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchFancyYarnsExpandedIndexChangedEvent extends FetchFancyYarnsEvent{
  final int newIndex;

  FetchFancyYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

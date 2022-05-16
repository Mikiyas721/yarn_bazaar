part of 'fetch_user_yarns_bloc.dart';

abstract class FetchUserYarnsEvent extends BlocEvent<FetchUserYarnsState> {}

class FetchUserYarnsDataChangedEvent extends FetchUserYarnsEvent {
  final List<Yarn> yarns;

  FetchUserYarnsDataChangedEvent(this.yarns);

  @override
  FetchUserYarnsState handle(FetchUserYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchUserYarnsStartedLoadingEvent extends FetchUserYarnsEvent {
  @override
  FetchUserYarnsState handle(FetchUserYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchUserYarnsStoppedLoadingEvent extends FetchUserYarnsEvent {
  @override
  FetchUserYarnsState handle(FetchUserYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchUserYarnsLoadFailureEvent extends FetchUserYarnsEvent {
  final Option<Failure> failure;

  FetchUserYarnsLoadFailureEvent(this.failure);

  @override
  FetchUserYarnsState handle(FetchUserYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchUserYarnsExpandedIndexChangedEvent extends FetchUserYarnsEvent{
  final int newIndex;

  FetchUserYarnsExpandedIndexChangedEvent(this.newIndex);
  @override
  FetchUserYarnsState handle(FetchUserYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}
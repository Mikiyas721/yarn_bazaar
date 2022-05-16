part of 'fetch_viscose_yarns_bloc.dart';

abstract class FetchViscoseYarnsEvent extends BlocEvent<FetchViscoseYarnsState> {}

class FetchViscoseYarnsDataChangedEvent extends FetchViscoseYarnsEvent {
  final List<Yarn> yarns;

  FetchViscoseYarnsDataChangedEvent(this.yarns);

  @override
  FetchViscoseYarnsState handle(FetchViscoseYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchViscoseYarnsStartedLoadingEvent extends FetchViscoseYarnsEvent {
  @override
  FetchViscoseYarnsState handle(FetchViscoseYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchViscoseYarnsStoppedLoadingEvent extends FetchViscoseYarnsEvent {
  @override
  FetchViscoseYarnsState handle(FetchViscoseYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchViscoseYarnsLoadFailureEvent extends FetchViscoseYarnsEvent {
  final Option<Failure> failure;

  FetchViscoseYarnsLoadFailureEvent(this.failure);

  @override
  FetchViscoseYarnsState handle(FetchViscoseYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchViscoseYarnsExpandedIndexChangedEvent extends FetchViscoseYarnsEvent{
  final int newIndex;

  FetchViscoseYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchViscoseYarnsState handle(FetchViscoseYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}
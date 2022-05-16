part of 'fetch_worsted_wool_yarns_bloc.dart';

abstract class FetchWorstedWoolYarnsEvent extends BlocEvent<FetchWorstedWoolYarnsState> {}

class FetchWorstedWoolYarnsDataChangedEvent extends FetchWorstedWoolYarnsEvent {
  final List<Yarn> yarns;

  FetchWorstedWoolYarnsDataChangedEvent(this.yarns);

  @override
  FetchWorstedWoolYarnsState handle(FetchWorstedWoolYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchWorstedWoolYarnsStartedLoadingEvent extends FetchWorstedWoolYarnsEvent {
  @override
  FetchWorstedWoolYarnsState handle(FetchWorstedWoolYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchWorstedWoolYarnsStoppedLoadingEvent extends FetchWorstedWoolYarnsEvent {
  @override
  FetchWorstedWoolYarnsState handle(FetchWorstedWoolYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchWorstedWoolYarnsLoadFailureEvent extends FetchWorstedWoolYarnsEvent {
  final Option<Failure> failure;

  FetchWorstedWoolYarnsLoadFailureEvent(this.failure);

  @override
  FetchWorstedWoolYarnsState handle(FetchWorstedWoolYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchWorstedWoolYarnsExpandedIndexChangedEvent extends FetchWorstedWoolYarnsEvent{
  final int newIndex;

  FetchWorstedWoolYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchWorstedWoolYarnsState handle(FetchWorstedWoolYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}
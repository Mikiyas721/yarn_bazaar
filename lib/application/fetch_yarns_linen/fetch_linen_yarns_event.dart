part of 'fetch_linen_yarns_bloc.dart';

abstract class FetchLinenYarnsEvent extends BlocEvent<FetchLinenYarnsState> {}

class FetchLinenYarnsDataChangedEvent extends FetchLinenYarnsEvent {
  final List<Yarn> yarns;

  FetchLinenYarnsDataChangedEvent(this.yarns);

  @override
  FetchLinenYarnsState handle(FetchLinenYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchLinenYarnsStartedLoadingEvent extends FetchLinenYarnsEvent {
  @override
  FetchLinenYarnsState handle(FetchLinenYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchLinenYarnsStoppedLoadingEvent extends FetchLinenYarnsEvent {
  @override
  FetchLinenYarnsState handle(FetchLinenYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchLinenYarnsLoadFailureEvent extends FetchLinenYarnsEvent {
  final Option<Failure> failure;

  FetchLinenYarnsLoadFailureEvent(this.failure);

  @override
  FetchLinenYarnsState handle(FetchLinenYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchLinenYarnsExpandedIndexChangedEvent extends FetchLinenYarnsEvent{
  final int newIndex;

  FetchLinenYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchLinenYarnsState handle(FetchLinenYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}


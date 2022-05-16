part of 'fetch_rayon_yarns_bloc.dart';

abstract class FetchRayonYarnsEvent extends BlocEvent<FetchRayonYarnsState> {}

class FetchRayonYarnsDataChangedEvent extends FetchRayonYarnsEvent {
  final List<Yarn> yarns;

  FetchRayonYarnsDataChangedEvent(this.yarns);

  @override
  FetchRayonYarnsState handle(FetchRayonYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchRayonYarnsStartedLoadingEvent extends FetchRayonYarnsEvent {
  @override
  FetchRayonYarnsState handle(FetchRayonYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchRayonYarnsStoppedLoadingEvent extends FetchRayonYarnsEvent {
  @override
  FetchRayonYarnsState handle(FetchRayonYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchRayonYarnsLoadFailureEvent extends FetchRayonYarnsEvent {
  final Option<Failure> failure;

  FetchRayonYarnsLoadFailureEvent(this.failure);

  @override
  FetchRayonYarnsState handle(FetchRayonYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchRayonYarnsExpandedIndexChangedEvent extends FetchRayonYarnsEvent{
  final int newIndex;

  FetchRayonYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchRayonYarnsState handle(FetchRayonYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

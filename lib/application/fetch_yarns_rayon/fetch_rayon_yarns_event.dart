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

class FetchRayonYarnsIsLoadingChangedEvent extends FetchRayonYarnsEvent {
  final bool isLoading;

  FetchRayonYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchRayonYarnsState handle(FetchRayonYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchRayonYarnsLoadFailureEvent extends FetchRayonYarnsEvent {
  final String errorMessage;

  FetchRayonYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchRayonYarnsState handle(FetchRayonYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

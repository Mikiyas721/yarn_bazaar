part of 'fetch_pv_yarns_bloc.dart';

abstract class FetchPvYarnsEvent extends BlocEvent<FetchPvYarnsState> {}

class FetchPvYarnsDataChangedEvent extends FetchPvYarnsEvent {
  final List<Yarn> yarns;

  FetchPvYarnsDataChangedEvent(this.yarns);

  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchPvYarnsIsLoadingChangedEvent extends FetchPvYarnsEvent {
  final bool isLoading;

  FetchPvYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchPvYarnsLoadFailureEvent extends FetchPvYarnsEvent {
  final String errorMessage;

  FetchPvYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchPvYarnsState handle(FetchPvYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

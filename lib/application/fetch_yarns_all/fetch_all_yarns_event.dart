part of 'fetch_all_yarns_bloc.dart';

abstract class FetchAllYarnsEvent extends BlocEvent<FetchAllYarnsState> {}

class FetchAllYarnsDataChangedEvent extends FetchAllYarnsEvent {
  final List<Yarn> yarns;

  FetchAllYarnsDataChangedEvent(this.yarns);

  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchAllYarnsIsLoadingChangedEvent extends FetchAllYarnsEvent {
  final bool isLoading;

  FetchAllYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchAllYarnsLoadFailureEvent extends FetchAllYarnsEvent {
  final String errorMessage;

  FetchAllYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchAllYarnsState handle(FetchAllYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
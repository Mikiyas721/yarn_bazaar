part of 'fetch_cp_yarns_bloc.dart';

abstract class FetchCpYarnsEvent extends BlocEvent<FetchCpYarnsState> {}

class FetchCpYarnsDataChangedEvent extends FetchCpYarnsEvent {
  final List<Yarn> yarns;

  FetchCpYarnsDataChangedEvent(this.yarns);

  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchCpYarnsIsLoadingChangedEvent extends FetchCpYarnsEvent {
  final bool isLoading;

  FetchCpYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchCpYarnsLoadFailureEvent extends FetchCpYarnsEvent {
  final String errorMessage;

  FetchCpYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchCpYarnsState handle(FetchCpYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

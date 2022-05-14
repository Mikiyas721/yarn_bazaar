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

class FetchViscoseYarnsIsLoadingChangedEvent extends FetchViscoseYarnsEvent {
  final bool isLoading;

  FetchViscoseYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchViscoseYarnsState handle(FetchViscoseYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchViscoseYarnsLoadFailureEvent extends FetchViscoseYarnsEvent {
  final String errorMessage;

  FetchViscoseYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchViscoseYarnsState handle(FetchViscoseYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
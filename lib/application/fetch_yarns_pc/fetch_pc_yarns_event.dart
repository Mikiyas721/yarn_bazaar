part of 'fetch_pc_yarns_bloc.dart';

abstract class FetchPcYarnsEvent extends BlocEvent<FetchPcYarnsState> {}

class FetchPcYarnsDataChangedEvent extends FetchPcYarnsEvent {
  final List<Yarn> yarns;

  FetchPcYarnsDataChangedEvent(this.yarns);

  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchPcYarnsIsLoadingChangedEvent extends FetchPcYarnsEvent {
  final bool isLoading;

  FetchPcYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchPcYarnsLoadFailureEvent extends FetchPcYarnsEvent {
  final String errorMessage;

  FetchPcYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchPcYarnsState handle(FetchPcYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

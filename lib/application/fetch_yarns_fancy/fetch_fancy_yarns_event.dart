part of 'fetch_fancy_yarns_bloc.dart';

abstract class FetchFancyYarnsEvent extends BlocEvent<FetchFancyYarnsState> {}

class FetchFancyYarnsDataChangedEvent extends FetchFancyYarnsEvent {
  final List<Yarn> yarns;

  FetchFancyYarnsDataChangedEvent(this.yarns);

  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchFancyYarnsIsLoadingChangedEvent extends FetchFancyYarnsEvent {
  final bool isLoading;

  FetchFancyYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchFancyYarnsLoadFailureEvent extends FetchFancyYarnsEvent {
  final String errorMessage;

  FetchFancyYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchFancyYarnsState handle(FetchFancyYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

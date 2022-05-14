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

class FetchLinenYarnsIsLoadingChangedEvent extends FetchLinenYarnsEvent {
  final bool isLoading;

  FetchLinenYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchLinenYarnsState handle(FetchLinenYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchLinenYarnsLoadFailureEvent extends FetchLinenYarnsEvent {
  final String errorMessage;

  FetchLinenYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchLinenYarnsState handle(FetchLinenYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}


part of 'fetch_cotton_yarns_bloc.dart';

abstract class FetchCottonYarnsEvent extends BlocEvent<FetchCottonYarnsState> {}

class FetchCottonYarnsDataChangedEvent extends FetchCottonYarnsEvent {
  final List<Yarn> yarns;

  FetchCottonYarnsDataChangedEvent(this.yarns);

  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchCottonYarnsIsLoadingChangedEvent extends FetchCottonYarnsEvent {
  final bool isLoading;

  FetchCottonYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchCottonYarnsLoadFailureEvent extends FetchCottonYarnsEvent {
  final String errorMessage;

  FetchCottonYarnsLoadFailureEvent(this.errorMessage);

  @override
  FetchCottonYarnsState handle(FetchCottonYarnsState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

part of 'fetch_cotton_yarns_bloc.dart';

abstract class FetchCottonYarnsEvent extends BlocEvent<FetchCottonYarnsState> {}

class FetchCottonYarnsDataChangedEvent extends FetchCottonYarnsEvent {
  final List<Yarn> yarns;

  FetchCottonYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchCottonYarnsState> handle(FetchCottonYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchCottonYarnsIsLoadingChangedEvent extends FetchCottonYarnsEvent {
  final bool isLoading;

  FetchCottonYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchCottonYarnsState> handle(FetchCottonYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchCottonYarnsLoadFailureEvent extends FetchCottonYarnsEvent {
  final String errorMessage;

  FetchCottonYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchCottonYarnsState> handle(FetchCottonYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

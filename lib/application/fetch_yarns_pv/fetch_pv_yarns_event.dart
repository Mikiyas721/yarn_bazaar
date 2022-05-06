part of 'fetch_pv_yarns_bloc.dart';

abstract class FetchPvYarnsEvent extends BlocEvent<FetchPvYarnsState> {}

class FetchPvYarnsDataChangedEvent extends FetchPvYarnsEvent {
  final List<Yarn> yarns;

  FetchPvYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchPvYarnsState> handle(FetchPvYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchPvYarnsIsLoadingChangedEvent extends FetchPvYarnsEvent {
  final bool isLoading;

  FetchPvYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchPvYarnsState> handle(FetchPvYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchPvYarnsLoadFailureEvent extends FetchPvYarnsEvent {
  final String errorMessage;

  FetchPvYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchPvYarnsState> handle(FetchPvYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

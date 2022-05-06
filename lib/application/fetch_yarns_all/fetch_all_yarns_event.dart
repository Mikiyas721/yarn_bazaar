part of 'fetch_all_yarns_bloc.dart';

abstract class FetchAllYarnsEvent extends BlocEvent<FetchAllYarnsState> {}

class FetchAllYarnsDataChangedEvent extends FetchAllYarnsEvent {
  final List<Yarn> yarns;

  FetchAllYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchAllYarnsState> handle(FetchAllYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchAllYarnsIsLoadingChangedEvent extends FetchAllYarnsEvent {
  final bool isLoading;

  FetchAllYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchAllYarnsState> handle(FetchAllYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchAllYarnsLoadFailureEvent extends FetchAllYarnsEvent {
  final String errorMessage;

  FetchAllYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchAllYarnsState> handle(FetchAllYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
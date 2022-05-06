part of 'fetch_modal_yarns_bloc.dart';

abstract class FetchModalYarnsEvent extends BlocEvent<FetchModalYarnsState> {}

class FetchModalYarnsDataChangedEvent extends FetchModalYarnsEvent {
  final List<Yarn> yarns;

  FetchModalYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchModalYarnsState> handle(FetchModalYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchModalYarnsIsLoadingChangedEvent extends FetchModalYarnsEvent {
  final bool isLoading;

  FetchModalYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchModalYarnsState> handle(FetchModalYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchModalYarnsLoadFailureEvent extends FetchModalYarnsEvent {
  final String errorMessage;

  FetchModalYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchModalYarnsState> handle(FetchModalYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

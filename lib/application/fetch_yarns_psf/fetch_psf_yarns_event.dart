part of 'fetch_psf_yarns_bloc.dart';

abstract class FetchPsfYarnsEvent extends BlocEvent<FetchPsfYarnsState> {}

class FetchPsfYarnsDataChangedEvent extends FetchPsfYarnsEvent {
  final List<Yarn> yarns;

  FetchPsfYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchPsfYarnsState> handle(FetchPsfYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchPsfYarnsIsLoadingChangedEvent extends FetchPsfYarnsEvent {
  final bool isLoading;

  FetchPsfYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchPsfYarnsState> handle(FetchPsfYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchPsfYarnsLoadFailureEvent extends FetchPsfYarnsEvent {
  final String errorMessage;

  FetchPsfYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchPsfYarnsState> handle(FetchPsfYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
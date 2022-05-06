part of 'fetch_pc_yarns_bloc.dart';

abstract class FetchPcYarnsEvent extends BlocEvent<FetchPcYarnsState> {}

class FetchPcYarnsDataChangedEvent extends FetchPcYarnsEvent {
  final List<Yarn> yarns;

  FetchPcYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchPcYarnsState> handle(FetchPcYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchPcYarnsIsLoadingChangedEvent extends FetchPcYarnsEvent {
  final bool isLoading;

  FetchPcYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchPcYarnsState> handle(FetchPcYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchPcYarnsLoadFailureEvent extends FetchPcYarnsEvent {
  final String errorMessage;

  FetchPcYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchPcYarnsState> handle(FetchPcYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

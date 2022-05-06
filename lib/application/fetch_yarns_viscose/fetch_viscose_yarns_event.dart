part of 'fetch_viscose_yarns_bloc.dart';

abstract class FetchViscoseYarnsEvent extends BlocEvent<FetchViscoseYarnsState> {}

class FetchViscoseYarnsDataChangedEvent extends FetchViscoseYarnsEvent {
  final List<Yarn> yarns;

  FetchViscoseYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchViscoseYarnsState> handle(FetchViscoseYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchViscoseYarnsIsLoadingChangedEvent extends FetchViscoseYarnsEvent {
  final bool isLoading;

  FetchViscoseYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchViscoseYarnsState> handle(FetchViscoseYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchViscoseYarnsLoadFailureEvent extends FetchViscoseYarnsEvent {
  final String errorMessage;

  FetchViscoseYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchViscoseYarnsState> handle(FetchViscoseYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
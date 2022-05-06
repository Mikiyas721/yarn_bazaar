part of 'fetch_worsted_wool_yarns_bloc.dart';

abstract class FetchWorstedWoolYarnsEvent extends BlocEvent<FetchWorstedWoolYarnsState> {}

class FetchWorstedWoolYarnsDataChangedEvent extends FetchWorstedWoolYarnsEvent {
  final List<Yarn> yarns;

  FetchWorstedWoolYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchWorstedWoolYarnsState> handle(FetchWorstedWoolYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchWorstedWoolYarnsIsLoadingChangedEvent extends FetchWorstedWoolYarnsEvent {
  final bool isLoading;

  FetchWorstedWoolYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchWorstedWoolYarnsState> handle(FetchWorstedWoolYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchWorstedWoolYarnsLoadFailureEvent extends FetchWorstedWoolYarnsEvent {
  final String errorMessage;

  FetchWorstedWoolYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchWorstedWoolYarnsState> handle(FetchWorstedWoolYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
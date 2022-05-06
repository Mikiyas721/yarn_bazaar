part of 'fetch_rayon_yarns_bloc.dart';

abstract class FetchRayonYarnsEvent extends BlocEvent<FetchRayonYarnsState> {}

class FetchRayonYarnsDataChangedEvent extends FetchRayonYarnsEvent {
  final List<Yarn> yarns;

  FetchRayonYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchRayonYarnsState> handle(FetchRayonYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchRayonYarnsIsLoadingChangedEvent extends FetchRayonYarnsEvent {
  final bool isLoading;

  FetchRayonYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchRayonYarnsState> handle(FetchRayonYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchRayonYarnsLoadFailureEvent extends FetchRayonYarnsEvent {
  final String errorMessage;

  FetchRayonYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchRayonYarnsState> handle(FetchRayonYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

part of 'fetch_texturize_yarns_bloc.dart';

abstract class FetchTexturizeYarnsEvent extends BlocEvent<FetchTexturizeYarnsState> {}

class FetchTexturizeYarnsDataChangedEvent extends FetchTexturizeYarnsEvent {
  final List<Yarn> yarns;

  FetchTexturizeYarnsDataChangedEvent(this.yarns);

  @override
  Stream<FetchTexturizeYarnsState> handle(FetchTexturizeYarnsState currentState) async* {
    yield currentState.copyWith(yarns: yarns);
  }
}

class FetchTexturizeYarnsIsLoadingChangedEvent extends FetchTexturizeYarnsEvent {
  final bool isLoading;

  FetchTexturizeYarnsIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchTexturizeYarnsState> handle(FetchTexturizeYarnsState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchTexturizeYarnsLoadFailureEvent extends FetchTexturizeYarnsEvent {
  final String errorMessage;

  FetchTexturizeYarnsLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchTexturizeYarnsState> handle(FetchTexturizeYarnsState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}

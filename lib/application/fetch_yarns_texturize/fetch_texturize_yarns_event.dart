part of 'fetch_texturize_yarns_bloc.dart';

abstract class FetchTexturizeYarnsEvent extends BlocEvent<FetchTexturizeYarnsState> {}

class FetchTexturizeYarnsDataChangedEvent extends FetchTexturizeYarnsEvent {
  final List<Yarn> yarns;

  FetchTexturizeYarnsDataChangedEvent(this.yarns);

  @override
  FetchTexturizeYarnsState handle(FetchTexturizeYarnsState currentState)  {
    return currentState.copyWith(yarns: yarns);
  }
}

class FetchTexturizeYarnsStartedLoadingEvent extends FetchTexturizeYarnsEvent {
  @override
  FetchTexturizeYarnsState handle(FetchTexturizeYarnsState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchTexturizeYarnsStoppedLoadingEvent extends FetchTexturizeYarnsEvent {
  @override
  FetchTexturizeYarnsState handle(FetchTexturizeYarnsState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchTexturizeYarnsLoadFailureEvent extends FetchTexturizeYarnsEvent {
  final Option<Failure> failure;

  FetchTexturizeYarnsLoadFailureEvent(this.failure);

  @override
  FetchTexturizeYarnsState handle(FetchTexturizeYarnsState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchTexturizeYarnsExpandedIndexChangedEvent extends FetchTexturizeYarnsEvent{
  final int newIndex;

  FetchTexturizeYarnsExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchTexturizeYarnsState handle(FetchTexturizeYarnsState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

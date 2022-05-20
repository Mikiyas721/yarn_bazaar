part of 'fetch_trader_users_bloc.dart';

abstract class FetchTraderUsersEvent extends BlocEvent<FetchTraderUsersState> {}

class FetchTraderUsersDataChangedEvent extends FetchTraderUsersEvent {
  final List<User> users;

  FetchTraderUsersDataChangedEvent(this.users);

  @override
  FetchTraderUsersState handle(FetchTraderUsersState currentState)  {
    return currentState.copyWith(users: users);
  }
}

class FetchTraderUsersStartedLoadingEvent extends FetchTraderUsersEvent {
  @override
  FetchTraderUsersState handle(FetchTraderUsersState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchTraderUsersStoppedLoadingEvent extends FetchTraderUsersEvent {
  @override
  FetchTraderUsersState handle(FetchTraderUsersState currentState)  {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchTraderUsersLoadFailureEvent extends FetchTraderUsersEvent {
  final Option<Failure> failure;

  FetchTraderUsersLoadFailureEvent(this.failure);

  @override
  FetchTraderUsersState handle(FetchTraderUsersState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchTraderUsersExpandedIndexChangedEvent extends FetchTraderUsersEvent{
  final int newIndex;

  FetchTraderUsersExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchTraderUsersState handle(FetchTraderUsersState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }

}
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

class FetchTraderUsersIsLoadingChangedEvent extends FetchTraderUsersEvent {
  final bool isLoading;

  FetchTraderUsersIsLoadingChangedEvent(this.isLoading);

  @override
  FetchTraderUsersState handle(FetchTraderUsersState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchTraderUsersLoadFailureEvent extends FetchTraderUsersEvent {
  final String errorMessage;

  FetchTraderUsersLoadFailureEvent(this.errorMessage);

  @override
  FetchTraderUsersState handle(FetchTraderUsersState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
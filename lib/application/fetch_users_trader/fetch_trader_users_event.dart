part of 'fetch_trader_users_bloc.dart';

abstract class FetchTraderUsersEvent extends BlocEvent<FetchTraderUsersState> {}

class FetchTraderUsersDataChangedEvent extends FetchTraderUsersEvent {
  final List<User> users;

  FetchTraderUsersDataChangedEvent(this.users);

  @override
  Stream<FetchTraderUsersState> handle(FetchTraderUsersState currentState) async* {
    yield currentState.copyWith(users: users);
  }
}

class FetchTraderUsersIsLoadingChangedEvent extends FetchTraderUsersEvent {
  final bool isLoading;

  FetchTraderUsersIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchTraderUsersState> handle(FetchTraderUsersState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchTraderUsersLoadFailureEvent extends FetchTraderUsersEvent {
  final String errorMessage;

  FetchTraderUsersLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchTraderUsersState> handle(FetchTraderUsersState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
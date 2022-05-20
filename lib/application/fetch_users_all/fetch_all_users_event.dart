part of 'fetch_all_users_bloc.dart';

abstract class FetchAllUsersEvent extends BlocEvent<FetchAllUsersState> {}

class FetchAllUsersDataChangedEvent extends FetchAllUsersEvent {
  final List<User> users;

  FetchAllUsersDataChangedEvent(this.users);

  @override
  FetchAllUsersState handle(FetchAllUsersState currentState) {
    return currentState.copyWith(users: users);
  }
}

class FetchAllUsersStartedLoadingEvent extends FetchAllUsersEvent {
  @override
  FetchAllUsersState handle(FetchAllUsersState currentState) {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchAllUsersStoppedLoadingEvent extends FetchAllUsersEvent {
  @override
  FetchAllUsersState handle(FetchAllUsersState currentState) {
    return currentState.copyWith(isLoading: false);
  }
}

class FetchAllUsersLoadFailureEvent extends FetchAllUsersEvent {
  final Option<Failure> failure;

  FetchAllUsersLoadFailureEvent(this.failure);

  @override
  FetchAllUsersState handle(FetchAllUsersState currentState) {
    return currentState.copyWith(error: failure);
  }
}

class FetchAllUsersExpandedIndexChangedEvent extends FetchAllUsersEvent {
  final int newIndex;

  FetchAllUsersExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchAllUsersState handle(FetchAllUsersState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }
}

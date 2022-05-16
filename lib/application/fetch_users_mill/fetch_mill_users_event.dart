part of 'fetch_mill_users_bloc.dart';

abstract class FetchMillUsersEvent extends BlocEvent<FetchMillUsersState> {}

class FetchMillUsersDataChangedEvent extends FetchMillUsersEvent {
  final List<User> users;

  FetchMillUsersDataChangedEvent(this.users);

  @override
  FetchMillUsersState handle(FetchMillUsersState currentState)  {
    return currentState.copyWith(users: users);
  }
}

class FetchMillUsersStartedLoadingEvent extends FetchMillUsersEvent {
  @override
  FetchMillUsersState handle(FetchMillUsersState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchMillUsersStoppedLoadingEvent extends FetchMillUsersEvent {
  @override
  FetchMillUsersState handle(FetchMillUsersState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchMillUsersLoadFailureEvent extends FetchMillUsersEvent {
  final Option<Failure> failure;

  FetchMillUsersLoadFailureEvent(this.failure);

  @override
  FetchMillUsersState handle(FetchMillUsersState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchMillUsersExpandedIndexChangedEvent extends FetchMillUsersEvent{
  final int newIndex;

  FetchMillUsersExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchMillUsersState handle(FetchMillUsersState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }

}
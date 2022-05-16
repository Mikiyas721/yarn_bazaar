part of 'fetch_broker_users_bloc.dart';

abstract class FetchBrokerUsersEvent extends BlocEvent<FetchBrokerUsersState> {}

class FetchBrokerUsersDataChangedEvent extends FetchBrokerUsersEvent {
  final List<User> users;

  FetchBrokerUsersDataChangedEvent(this.users);

  @override
  FetchBrokerUsersState handle(FetchBrokerUsersState currentState)  {
    return currentState.copyWith(users: users);
  }
}

class FetchBrokerUsersStartedLoadingEvent extends FetchBrokerUsersEvent {
  @override
  FetchBrokerUsersState handle(FetchBrokerUsersState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchBrokerUsersStoppedLoadingEvent extends FetchBrokerUsersEvent {
  @override
  FetchBrokerUsersState handle(FetchBrokerUsersState currentState)  {
    return currentState.copyWith(isLoading: true);
  }
}

class FetchBrokerUsersLoadFailureEvent extends FetchBrokerUsersEvent {
  final Option<Failure> failure;

  FetchBrokerUsersLoadFailureEvent(this.failure);

  @override
  FetchBrokerUsersState handle(FetchBrokerUsersState currentState)  {
    return currentState.copyWith(error: failure);
  }
}

class FetchBrokerUsersExpandedIndexChangedEvent extends FetchBrokerUsersEvent{
  final int newIndex;

  FetchBrokerUsersExpandedIndexChangedEvent(this.newIndex);

  @override
  FetchBrokerUsersState handle(FetchBrokerUsersState currentState) {
    return currentState.copyWith(expandedIndex: newIndex);
  }

}
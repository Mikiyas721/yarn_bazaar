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

class FetchBrokerUsersIsLoadingChangedEvent extends FetchBrokerUsersEvent {
  final bool isLoading;

  FetchBrokerUsersIsLoadingChangedEvent(this.isLoading);

  @override
  FetchBrokerUsersState handle(FetchBrokerUsersState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchBrokerUsersLoadFailureEvent extends FetchBrokerUsersEvent {
  final String errorMessage;

  FetchBrokerUsersLoadFailureEvent(this.errorMessage);

  @override
  FetchBrokerUsersState handle(FetchBrokerUsersState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
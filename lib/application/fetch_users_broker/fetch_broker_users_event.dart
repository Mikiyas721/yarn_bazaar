part of 'fetch_broker_users_bloc.dart';

abstract class FetchBrokerUsersEvent extends BlocEvent<FetchBrokerUsersState> {}

class FetchBrokerUsersDataChangedEvent extends FetchBrokerUsersEvent {
  final List<User> users;

  FetchBrokerUsersDataChangedEvent(this.users);

  @override
  Stream<FetchBrokerUsersState> handle(FetchBrokerUsersState currentState) async* {
    yield currentState.copyWith(users: users);
  }
}

class FetchBrokerUsersIsLoadingChangedEvent extends FetchBrokerUsersEvent {
  final bool isLoading;

  FetchBrokerUsersIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchBrokerUsersState> handle(FetchBrokerUsersState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchBrokerUsersLoadFailureEvent extends FetchBrokerUsersEvent {
  final String errorMessage;

  FetchBrokerUsersLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchBrokerUsersState> handle(FetchBrokerUsersState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
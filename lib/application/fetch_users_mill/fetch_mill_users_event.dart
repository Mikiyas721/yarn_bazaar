part of 'fetch_mill_users_bloc.dart';

abstract class FetchMillUsersEvent extends BlocEvent<FetchMillUsersState> {}

class FetchMillUsersDataChangedEvent extends FetchMillUsersEvent {
  final List<User> users;

  FetchMillUsersDataChangedEvent(this.users);

  @override
  Stream<FetchMillUsersState> handle(FetchMillUsersState currentState) async* {
    yield currentState.copyWith(users: users);
  }
}

class FetchMillUsersIsLoadingChangedEvent extends FetchMillUsersEvent {
  final bool isLoading;

  FetchMillUsersIsLoadingChangedEvent(this.isLoading);

  @override
  Stream<FetchMillUsersState> handle(FetchMillUsersState currentState) async* {
    yield currentState.copyWith(isLoading: isLoading);
  }
}

class FetchMillUsersLoadFailureEvent extends FetchMillUsersEvent {
  final String errorMessage;

  FetchMillUsersLoadFailureEvent(this.errorMessage);

  @override
  Stream<FetchMillUsersState> handle(FetchMillUsersState currentState) async* {
    yield currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
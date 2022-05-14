part of 'fetch_all_users_bloc.dart';

abstract class FetchAllUsersEvent extends BlocEvent<FetchAllUsersState>{}

class FetchAllUsersDataChangedEvent extends FetchAllUsersEvent {
  final List<User> users;

  FetchAllUsersDataChangedEvent(this.users);

  @override
  FetchAllUsersState handle(FetchAllUsersState currentState)  {
    return currentState.copyWith(users: users);
  }
}

class FetchAllUsersIsLoadingChangedEvent extends FetchAllUsersEvent {
  final bool isLoading;

  FetchAllUsersIsLoadingChangedEvent(this.isLoading);

  @override
  FetchAllUsersState handle(FetchAllUsersState currentState)  {
    return currentState.copyWith(isLoading: isLoading);
  }
}

class FetchAllUsersLoadFailureEvent extends FetchAllUsersEvent {
  final String errorMessage;

  FetchAllUsersLoadFailureEvent(this.errorMessage);

  @override
  FetchAllUsersState handle(FetchAllUsersState currentState)  {
    return currentState.copyWith(error: SimpleFailure.withOption(errorMessage));
  }
}
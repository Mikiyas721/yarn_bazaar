part of 'fetch_broker_users_bloc.dart';

@freezed
abstract class FetchBrokerUsersState extends BlocState with _$FetchBrokerUsersState {
  const factory FetchBrokerUsersState({
    required List<User> users,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchBrokerUsersState;

  factory FetchBrokerUsersState.initial() => FetchBrokerUsersState(
    users: const [],
    isLoading: false,
    error: none(),
    expandedIndex: -1,
  );
}


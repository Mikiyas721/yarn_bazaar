part of 'fetch_mill_users_bloc.dart';

@freezed
abstract class FetchMillUsersState extends BlocState with _$FetchMillUsersState {
  const factory FetchMillUsersState({
    required List<User> users,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchMillUsersState;

  factory FetchMillUsersState.initial() => FetchMillUsersState(
    users: const [],
    isLoading: false,
    error: none(),
  );
}


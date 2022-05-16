part of 'fetch_mill_users_bloc.dart';

@freezed
abstract class FetchMillUsersState extends BlocState with _$FetchMillUsersState {
  const factory FetchMillUsersState({
    required List<User> users,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchMillUsersState;

  factory FetchMillUsersState.initial() => FetchMillUsersState(
        users: const [],
        isLoading: false,
        error: none(),
        expandedIndex: -1,
      );
}

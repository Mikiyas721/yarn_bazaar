part of 'fetch_all_users_bloc.dart';

@freezed
abstract class FetchAllUsersState extends BlocState with _$FetchAllUsersState {
  const factory FetchAllUsersState({
    required List<User> users,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchAllUsersState;

  factory FetchAllUsersState.initial() => FetchAllUsersState(
        users: const [],
        isLoading: false,
        error: none(),
      );
}

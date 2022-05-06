part of 'fetch_trader_users_bloc.dart';

@freezed
abstract class FetchTraderUsersState extends BlocState with _$FetchTraderUsersState {
  const factory FetchTraderUsersState({
    required List<User> users,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchTraderUsersState;

  factory FetchTraderUsersState.initial() => FetchTraderUsersState(
    users: const [],
    isLoading: false,
    error: none(),
  );
}


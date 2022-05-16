part of 'fetch_user_yarns_bloc.dart';

@freezed
abstract class FetchUserYarnsState extends BlocState with _$FetchUserYarnsState {
  const factory FetchUserYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchUserYarnsState;

  factory FetchUserYarnsState.initial() => FetchUserYarnsState(
        yarns: const [],
        isLoading: false,
        error: none(),
        expandedIndex: 0,
      );
}

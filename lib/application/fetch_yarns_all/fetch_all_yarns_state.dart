part of 'fetch_all_yarns_bloc.dart';

@freezed
abstract class FetchAllYarnsState extends BlocState with _$FetchAllYarnsState {
  const factory FetchAllYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchAllYarnsState;

  factory FetchAllYarnsState.initial() => FetchAllYarnsState(
        yarns: const [],
        isLoading: false,
        error: none(),
      );
}

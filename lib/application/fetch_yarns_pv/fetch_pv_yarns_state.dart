part of 'fetch_pv_yarns_bloc.dart';

@freezed
abstract class FetchPvYarnsState extends BlocState with _$FetchPvYarnsState {
  const factory FetchPvYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchPvYarnsState;

  factory FetchPvYarnsState.initial() => FetchPvYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
  );
}

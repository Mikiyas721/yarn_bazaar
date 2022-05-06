part of 'fetch_linen_yarns_bloc.dart';

@freezed
abstract class FetchLinenYarnsState extends BlocState with _$FetchLinenYarnsState {
  const factory FetchLinenYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchLinenYarnsState;

  factory FetchLinenYarnsState.initial() => FetchLinenYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
  );
}

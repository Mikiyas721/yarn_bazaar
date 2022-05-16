part of 'fetch_rayon_yarns_bloc.dart';

@freezed
abstract class FetchRayonYarnsState extends BlocState with _$FetchRayonYarnsState {
  const factory FetchRayonYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchRayonYarnsState;

  factory FetchRayonYarnsState.initial() => FetchRayonYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
    expandedIndex: -1,
  );
}


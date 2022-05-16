part of 'fetch_cotton_yarns_bloc.dart';

@freezed
abstract class FetchCottonYarnsState extends BlocState with _$FetchCottonYarnsState {
  const factory FetchCottonYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchCottonYarnsState;

  factory FetchCottonYarnsState.initial() => FetchCottonYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
    expandedIndex: -1,
  );
}


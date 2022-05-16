part of 'fetch_similar_yarns_bloc.dart';

@freezed
abstract class FetchSimilarYarnsState extends BlocState with _$FetchSimilarYarnsState {
  const factory FetchSimilarYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchSimilarYarnsState;

  factory FetchSimilarYarnsState.initial() => FetchSimilarYarnsState(
        yarns: const [],
        isLoading: false,
        error: none(),
        expandedIndex: -1,
      );
}

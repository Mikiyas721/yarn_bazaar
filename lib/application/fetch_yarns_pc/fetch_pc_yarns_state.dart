part of 'fetch_pc_yarns_bloc.dart';

@freezed
abstract class FetchPcYarnsState extends BlocState with _$FetchPcYarnsState {
  const factory FetchPcYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchPcYarnsState;

  factory FetchPcYarnsState.initial() => FetchPcYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
    expandedIndex: -1,
  );
}

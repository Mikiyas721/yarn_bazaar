part of 'fetch_worsted_wool_yarns_bloc.dart';

@freezed
abstract class FetchWorstedWoolYarnsState extends BlocState with _$FetchWorstedWoolYarnsState {
  const factory FetchWorstedWoolYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchWorstedWoolYarnsState;

  factory FetchWorstedWoolYarnsState.initial() => FetchWorstedWoolYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
    expandedIndex: -1,
  );
}


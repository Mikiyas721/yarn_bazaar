part of 'fetch_fancy_yarns_bloc.dart';

@freezed
abstract class FetchFancyYarnsState extends BlocState with _$FetchFancyYarnsState{
  const factory FetchFancyYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchFancyYarnsState;

  factory FetchFancyYarnsState.initial() => FetchFancyYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
    expandedIndex: -1,
  );
}


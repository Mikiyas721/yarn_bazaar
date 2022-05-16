part of 'fetch_texturize_yarns_bloc.dart';

@freezed
abstract class FetchTexturizeYarnsState extends BlocState with _$FetchTexturizeYarnsState{
  const factory FetchTexturizeYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
    required int expandedIndex,
  }) = _FetchTexturizeYarnsState;

  factory FetchTexturizeYarnsState.initial() => FetchTexturizeYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
    expandedIndex: -1,
  );
}

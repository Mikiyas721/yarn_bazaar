part of 'fetch_modal_yarns_bloc.dart';

@freezed
abstract class FetchModalYarnsState extends BlocState with _$FetchModalYarnsState {
  const factory FetchModalYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchModalYarnsState;

  factory FetchModalYarnsState.initial() => FetchModalYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
  );
}



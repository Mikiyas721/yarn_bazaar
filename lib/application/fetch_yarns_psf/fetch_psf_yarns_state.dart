part of 'fetch_psf_yarns_bloc.dart';

@freezed
abstract class FetchPsfYarnsState extends BlocState with _$FetchPsfYarnsState {
  const factory FetchPsfYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchPsfYarnsState;

  factory FetchPsfYarnsState.initial() => FetchPsfYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
  );
}


part of 'fetch_cp_yarns_bloc.dart';

@freezed
abstract class FetchCpYarnsState extends BlocState with _$FetchCpYarnsState {
  const factory FetchCpYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchCpYarnsState;

  factory FetchCpYarnsState.initial() => FetchCpYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
  );
}

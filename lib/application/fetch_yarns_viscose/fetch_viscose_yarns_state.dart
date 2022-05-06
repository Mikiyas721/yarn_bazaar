part of 'fetch_viscose_yarns_bloc.dart';

@freezed
abstract class FetchViscoseYarnsState extends BlocState with _$FetchViscoseYarnsState {
  const factory FetchViscoseYarnsState({
    required List<Yarn> yarns,
    required bool isLoading,
    required Option<Failure> error,
  }) = _FetchViscoseYarnsState;

  factory FetchViscoseYarnsState.initial() => FetchViscoseYarnsState(
    yarns: const [],
    isLoading: false,
    error: none(),
  );
}


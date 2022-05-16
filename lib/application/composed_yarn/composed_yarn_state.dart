part of 'composed_yarn_bloc.dart';

@freezed
abstract class ComposedYarnState extends BlocState with _$ComposedYarnState {
  const factory ComposedYarnState({required bool isAdding}) = _ComposedYarnState;

  factory ComposedYarnState.initial() => ComposedYarnState(
    isAdding: false,
      );
}

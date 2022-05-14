part of 'select_option_bloc.dart';

@freezed
abstract class SelectOptionState extends BlocState with _$SelectOptionState {
  const factory SelectOptionState({
    required List<String> options,
    required bool isMultiSelect,
    List<bool>? selectedOptions,
    int? selectedOptionIndex,
    required Option<Failure> failure,
  }) = _SelectOptionState;

  factory SelectOptionState.initial() => SelectOptionState(
        options: [],
        isMultiSelect: false,
        failure: none(),
      );
}

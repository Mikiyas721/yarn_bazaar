import 'package:yarn_bazaar/common/view_model.dart';

class InputSelectionViewModel extends ViewModel {
  final List<String> options;
  final bool isMultiSelect;
  final int? selectedOptionIndex;
  final List<bool>? selectedOptions;
  final String? errorMessage;

  InputSelectionViewModel({
    required this.options,
    required this.isMultiSelect,
    this.selectedOptionIndex,
    this.selectedOptions,
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        options,
        isMultiSelect,
        selectedOptionIndex,
        selectedOptions,
        errorMessage,
      ];
}

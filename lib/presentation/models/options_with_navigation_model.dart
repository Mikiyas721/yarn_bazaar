class OptionsWithNavigationModel {
  final String title;
  final List<String> options;
  final int? selectedOptionIndex;
  List<bool>? selectedOptions;
  final bool isMultiSelect;

  OptionsWithNavigationModel({
    required this.title,
    required this.options,
    this.selectedOptionIndex = -1,
    this.selectedOptions,
    required this.isMultiSelect,
  }) {
    if (isMultiSelect && selectedOptions == null)
      selectedOptions = List.filled(options.length, false);
  }
}

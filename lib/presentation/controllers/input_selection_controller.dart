import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/select_option/select_option_bloc.dart';
import 'package:yarn_bazaar/presentation/models/input_selection_view_model.dart';
import 'package:yarn_bazaar/presentation/models/options_with_navigation_model.dart';

class InputSelectionController extends BlocViewModelController<SelectOptionBloc,
    SelectOptionEvent, SelectOptionState, InputSelectionViewModel> {
  final OptionsWithNavigationModel? arguments;

  InputSelectionController(
    BuildContext context,
    this.arguments,
  ) : super(context, getIt.get<SelectOptionBloc>(), true);

  @override
  InputSelectionViewModel mapStateToViewModel(SelectOptionState s) {
    return InputSelectionViewModel(
      options: s.options,
      isMultiSelect: s.isMultiSelect,
      selectedOptionIndex: s.selectedOptionIndex,
      selectedOptions: s.selectedOptions,
      errorMessage: s.failure.fold(() => null, (a) => a.message),
    );
  }

  setUpSelectionView() {
    if (arguments == null) {
      bloc.add(SelectOptionFailureOccurredEvent(
          getOption(SimpleFailure("Proper Arguments not provided"))));
    } else if (arguments!.options.length == 0) {
      bloc.add(
          SelectOptionFailureOccurredEvent(getOption(SimpleFailure("No Options provided"))));
    } else {
      bloc.add(SelectOptionSetIsMultiSelectEvent(arguments!.isMultiSelect));
      bloc.add(SelectOptionOptionsChangedEvent(arguments!.options));

      arguments!.isMultiSelect
          ? bloc.add(SelectOptionSelectedOptionsChangedEvent(arguments!.selectedOptions!))
          : bloc.add(SelectOptionSelectedOptionChangedEvent(arguments!.selectedOptionIndex!));
    }
  }

  onOptionSelect(int selectedIndex) {
    currentState.isMultiSelect
        ? bloc.add(SelectOptionSelectedOptionsChangedEvent(
            getUpdatedList(currentState.selectedOptions!, selectedIndex)))
        : bloc.add(SelectOptionSelectedOptionChangedEvent(selectedIndex));
  }

  onSubmit() {
    Navigator.pop(
        context,
        currentState.isMultiSelect
            ? getSelectedItems()
            : currentState.selectedOptionIndex == -1
                ? null
                : arguments!.options[currentState.selectedOptionIndex!]);
  }

  List<bool> getUpdatedList(List<bool> selectedOptions, int index) {
    selectedOptions[index] = !selectedOptions[index];
    return selectedOptions;
  }

  List<String> getSelectedItems() {
    List<String> selectedItems = [];
    for (int i = 0; i < currentState.selectedOptions!.length; i++) {
      if (currentState.selectedOptions![i]) selectedItems.add(currentState.options[i]);
    }
    return selectedItems;
  }
}

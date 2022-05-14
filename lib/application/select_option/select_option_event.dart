part of 'select_option_bloc.dart';

abstract class SelectOptionEvent extends BlocEvent<SelectOptionState> {}

class SelectOptionOptionsChangedEvent extends SelectOptionEvent{
  final List<String> options;

  SelectOptionOptionsChangedEvent(this.options);

  @override
  SelectOptionState handle(SelectOptionState currentState)  {
    return currentState.copyWith(options: options);
  }
}

class SelectOptionSetIsMultiSelectEvent extends SelectOptionEvent{
  final bool isMultiSelect;

  SelectOptionSetIsMultiSelectEvent(this.isMultiSelect);

  @override
  SelectOptionState handle(SelectOptionState currentState)  {
    return currentState.copyWith(isMultiSelect: isMultiSelect);
  }
}

class SelectOptionSelectedOptionChangedEvent extends SelectOptionEvent{
  final int selectedOptionIndex;

  SelectOptionSelectedOptionChangedEvent(this.selectedOptionIndex);

  @override
  SelectOptionState handle(SelectOptionState currentState)  {
    return currentState.copyWith(selectedOptionIndex: selectedOptionIndex);
  }
}

class SelectOptionSelectedOptionsChangedEvent extends SelectOptionEvent{
  final List<bool> selectedOptions;

  SelectOptionSelectedOptionsChangedEvent(this.selectedOptions);

  @override
  SelectOptionState handle(SelectOptionState currentState)  {
    return currentState.copyWith(selectedOptions: selectedOptions);
  }
}

class SelectOptionFailureOccurredEvent extends SelectOptionEvent{
  final Option<Failure> failure;

  SelectOptionFailureOccurredEvent(this.failure);

  @override
  SelectOptionState handle(SelectOptionState currentState)  {
    return currentState.copyWith(failure: failure);
  }
}

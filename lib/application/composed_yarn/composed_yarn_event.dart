part of 'composed_yarn_bloc.dart';

abstract class ComposedYarnEvent extends BlocEvent<ComposedYarnState> {}

class ComposedYarnStartedAddingEvent extends ComposedYarnEvent{
  @override
  ComposedYarnState handle(ComposedYarnState currentState) {
  return currentState.copyWith(isAdding:true);
  }
}

class ComposedYarnStoppedAddingEvent extends ComposedYarnEvent{
  @override
  ComposedYarnState handle(ComposedYarnState currentState) {
    return currentState.copyWith(isAdding:false);
  }
}

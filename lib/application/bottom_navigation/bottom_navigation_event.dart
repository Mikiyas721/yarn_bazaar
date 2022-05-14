part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends BlocEvent<BottomNavigationState> {}

class BottomNavigationSelectedIndexChangedEvent extends BottomNavigationEvent {
  final int index;

  BottomNavigationSelectedIndexChangedEvent(this.index);

  @override
  BottomNavigationState handle(BottomNavigationState currentState)  {
    return currentState.copyWith(activeIndex: index);
  }
}

part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends BlocEvent<BottomNavigationState> {}

class BottomNavigationSelectedIndexChangedEvent extends BottomNavigationEvent {
  final int index;

  BottomNavigationSelectedIndexChangedEvent(this.index);

  @override
  Stream<BottomNavigationState> handle(BottomNavigationState currentState) async* {
    yield currentState.copyWith(activeIndex: index);
  }
}

part of 'bottom_navigation_bloc.dart';

@freezed
abstract class BottomNavigationState extends BlocState with _$BottomNavigationState {
  const factory BottomNavigationState({required int activeIndex}) = _BottomNavigationState;

  factory BottomNavigationState.initial() => BottomNavigationState(activeIndex: 0);
}

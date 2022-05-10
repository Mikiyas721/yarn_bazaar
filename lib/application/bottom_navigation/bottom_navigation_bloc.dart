import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

part 'bottom_navigation_bloc.freezed.dart';

@lazySingleton
class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState.initial()) {
    on<BottomNavigationEvent>((event, emit) {
      event.handle(state);
    });
  }
}

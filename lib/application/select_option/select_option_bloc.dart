import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';

part 'select_option_event.dart';
part 'select_option_state.dart';

part 'select_option_bloc.freezed.dart';

@lazySingleton
class SelectOptionBloc extends Bloc<SelectOptionEvent, SelectOptionState> {
  SelectOptionBloc() : super(SelectOptionState.initial()) {
    on<SelectOptionEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  SelectOptionState get initialState => SelectOptionState.initial();
}

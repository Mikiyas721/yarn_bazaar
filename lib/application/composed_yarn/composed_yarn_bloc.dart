import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';

part 'composed_yarn_event.dart';
part 'composed_yarn_state.dart';

part 'composed_yarn_bloc.freezed.dart';

@lazySingleton
class ComposedYarnBloc extends Bloc<ComposedYarnEvent, ComposedYarnState> {
  ComposedYarnBloc() : super(ComposedYarnState.initial()) {
    on<ComposedYarnEvent>((event, emit) {
      emit(event.handle(state));
    });
  }
}

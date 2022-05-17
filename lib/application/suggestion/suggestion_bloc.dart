import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/domain/value_objects/suggestion_body.dart';
import 'package:yarn_bazaar/domain/value_objects/suggestion_type.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

part 'suggestion_bloc.freezed.dart';

@lazySingleton
class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  SuggestionBloc() : super(SuggestionState.initial()) {
    on<SuggestionEvent>((event, emit) {
      emit(event.handle(state));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/domain/value_objects/password.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

part 'reset_password_bloc.freezed.dart';

@lazySingleton
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordState.initial()) {
    on<ResetPasswordEvent>((event, emit) {
      emit(event.handle(state));
    });
  }
}

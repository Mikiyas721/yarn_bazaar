import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/domain/value_objects/password.dart';

part 'edit_password_event.dart';
part 'edit_password_state.dart';

part 'edit_password_bloc.freezed.dart';

@lazySingleton
class EditPasswordBloc extends Bloc<EditPasswordEvent, EditPasswordState> {
  EditPasswordBloc() : super(EditPasswordState.initial()) {
    on<EditPasswordEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  EditPasswordState get initial => EditPasswordState.initial();
}

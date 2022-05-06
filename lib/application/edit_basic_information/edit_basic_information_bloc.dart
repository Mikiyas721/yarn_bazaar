import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/domain/value_objects/email.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';
import 'package:yarn_bazaar/domain/value_objects/website.dart';
import 'package:yarn_bazaar/domain/value_objects/year.dart';

part 'edit_basic_information_event.dart';

part 'edit_basic_information_state.dart';

part 'edit_basic_information_bloc.freezed.dart';

@injectable
class EditBasicInformationBloc
    extends Bloc<EditBasicInformationEvent, EditBasicInformationState> {
  EditBasicInformationBloc() : super(EditBasicInformationState.initial()) {
    on<EditBasicInformationEvent>((event, emit) {
      event.handle(state);
    });
  }
}

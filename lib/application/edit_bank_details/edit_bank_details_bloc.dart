import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/bank_details.dart';
import 'package:yarn_bazaar/domain/value_objects/account_number.dart';
import 'package:yarn_bazaar/domain/value_objects/ifsc_code.dart';

part 'edit_bank_details_event.dart';
part 'edit_bank_details_state.dart';

part 'edit_bank_details_bloc.freezed.dart';

@lazySingleton
class EditBankDetailsBloc
    extends Bloc<EditBankDetailsEvent, EditBankDetailsState> {
  EditBankDetailsBloc() : super(EditBankDetailsState.initial()) {
    on<EditBankDetailsEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  EditBankDetailsState get initial => EditBankDetailsState.initial();
}

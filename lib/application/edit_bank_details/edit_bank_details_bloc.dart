import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/domain/value_objects/account_number.dart';
import 'package:yarn_bazaar/domain/value_objects/ifsc_code.dart';

part 'edit_bank_details_event.dart';
part 'edit_bank_details_state.dart';

part 'edit_bank_details_bloc.freezed.dart';

@injectable
class EditBankDetailsBloc
    extends Bloc<EditBankDetailsEvent, EditBankDetailsState> {
  EditBankDetailsBloc() : super(EditBankDetailsState.initial()) {
    on<EditBankDetailsEvent>((event, emit) {
      event.handle(state);
    });
  }

  EditBankDetailsState get initial => EditBankDetailsState.initial();
}

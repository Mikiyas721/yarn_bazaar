import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/business_details.dart';
import 'package:yarn_bazaar/domain/value_objects/company_name.dart';
import 'package:yarn_bazaar/domain/value_objects/gst_number.dart';
import 'package:yarn_bazaar/domain/value_objects/pan_number.dart';
import 'package:yarn_bazaar/domain/value_objects/tan_number.dart';

part 'edit_business_details_event.dart';
part 'edit_business_details_state.dart';

part 'edit_business_details_bloc.freezed.dart';

@lazySingleton
class EditBusinessDetailsBloc extends Bloc<EditBusinessDetailsEvent, EditBusinessDetailsState> {
  EditBusinessDetailsBloc() : super(EditBusinessDetailsState.initial()) {
    on<EditBusinessDetailsEvent>((event, emit) {
      emit(event.handle(state));
    });
  }
}

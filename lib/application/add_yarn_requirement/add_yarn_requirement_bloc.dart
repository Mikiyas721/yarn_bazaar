import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/domain/value_objects/delivery_area.dart';
import 'package:yarn_bazaar/domain/value_objects/payment_terms.dart';
import 'package:yarn_bazaar/domain/value_objects/quantity.dart';

part 'add_yarn_requirement_event.dart';
part 'add_yarn_requirement_state.dart';

part 'add_yarn_requirement_bloc.freezed.dart';

@injectable
class AddYarnRequirementBloc extends Bloc<AddYarnRequirementEvent, AddYarnRequirementState> {
  AddYarnRequirementBloc() : super(AddYarnRequirementState.initial()) {
    on<AddYarnRequirementEvent>((event, emit) {
      event.handle(state);
    });
  }

  AddYarnRequirementState get initialState => AddYarnRequirementState.initial();
}

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/domain/value_objects/company_name.dart';
import 'package:yarn_bazaar/domain/value_objects/name.dart';
import 'package:yarn_bazaar/domain/value_objects/other_user.dart';
import 'package:yarn_bazaar/domain/value_objects/password.dart';
import 'package:yarn_bazaar/domain/value_objects/phone_number.dart';
import 'package:yarn_bazaar/domain/value_objects/verification_code.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

part 'sign_up_bloc.freezed.dart';


@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()){
    on<SignUpEvent>((SignUpEvent event, emit) {
      event.handle(state);
    });
  }

  SignUpState get initialState => SignUpState.initial();

}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_viscose_yarns_event.dart';
part 'fetch_viscose_yarns_state.dart';

part 'fetch_viscose_yarns_bloc.freezed.dart';

@injectable
class FetchViscoseYarnsBloc extends Bloc<FetchViscoseYarnsEvent, FetchViscoseYarnsState> {
  FetchViscoseYarnsBloc() : super(FetchViscoseYarnsState.initial()) {
    on<FetchViscoseYarnsEvent>((event, emit) {
      event.handle(state);
    });
  }

  FetchViscoseYarnsState get initial => FetchViscoseYarnsState.initial();
}

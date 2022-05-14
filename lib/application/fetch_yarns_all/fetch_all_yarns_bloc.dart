import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_all_yarns_event.dart';

part 'fetch_all_yarns_state.dart';

part 'fetch_all_yarns_bloc.freezed.dart';

@lazySingleton
class FetchAllYarnsBloc extends Bloc<FetchAllYarnsEvent, FetchAllYarnsState> {
  FetchAllYarnsBloc() : super(FetchAllYarnsState.initial()) {
    on<FetchAllYarnsEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  FetchAllYarnsState get initial => FetchAllYarnsState.initial();
}

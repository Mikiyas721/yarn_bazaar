import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_modal_yarns_event.dart';
part 'fetch_modal_yarns_state.dart';

part 'fetch_modal_yarns_bloc.freezed.dart';

@lazySingleton
class FetchModalYarnsBloc extends Bloc<FetchModalYarnsEvent, FetchModalYarnsState> {
  FetchModalYarnsBloc() : super(FetchModalYarnsState.initial()) {
    on<FetchModalYarnsEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  FetchModalYarnsState get initial => FetchModalYarnsState.initial();
}

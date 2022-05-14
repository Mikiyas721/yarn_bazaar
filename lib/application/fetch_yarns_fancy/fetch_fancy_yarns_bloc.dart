import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_fancy_yarns_event.dart';
part 'fetch_fancy_yarns_state.dart';

part 'fetch_fancy_yarns_bloc.freezed.dart';

@lazySingleton
class FetchFancyYarnsBloc extends Bloc<FetchFancyYarnsEvent, FetchFancyYarnsState> {
  FetchFancyYarnsBloc() : super(FetchFancyYarnsState.initial()) {
    on<FetchFancyYarnsEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  FetchFancyYarnsState get initial => FetchFancyYarnsState.initial();
}

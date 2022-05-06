import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_worsted_wool_yarns_event.dart';
part 'fetch_worsted_wool_yarns_state.dart';

part 'fetch_worsted_wool_yarns_bloc.freezed.dart';

@injectable
class FetchWorstedWoolYarnsBloc extends Bloc<FetchWorstedWoolYarnsEvent, FetchWorstedWoolYarnsState> {
  FetchWorstedWoolYarnsBloc() : super(FetchWorstedWoolYarnsState.initial()) {
    on<FetchWorstedWoolYarnsEvent>((event, emit) {
      event.handle(state);
    });
  }

  FetchWorstedWoolYarnsState get initial => FetchWorstedWoolYarnsState.initial();
}

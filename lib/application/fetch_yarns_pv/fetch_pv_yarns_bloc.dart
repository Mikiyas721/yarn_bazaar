import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_pv_yarns_event.dart';
part 'fetch_pv_yarns_state.dart';

part 'fetch_pv_yarns_bloc.freezed.dart';

@injectable
class FetchPvYarnsBloc extends Bloc<FetchPvYarnsEvent, FetchPvYarnsState> {
  FetchPvYarnsBloc() : super(FetchPvYarnsState.initial()) {
    on<FetchPvYarnsEvent>((event, emit) {
      event.handle(state);
    });
  }

  FetchPvYarnsState get initial => FetchPvYarnsState.initial();
}

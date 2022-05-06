import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_cp_yarns_event.dart';
part 'fetch_cp_yarns_state.dart';

part 'fetch_cp_yarns_bloc.freezed.dart';

@injectable
class FetchCpYarnsBloc extends Bloc<FetchCpYarnsEvent, FetchCpYarnsState> {
  FetchCpYarnsBloc() : super(FetchCpYarnsState.initial()) {
    on<FetchCpYarnsEvent>((event, emit) {
      event.handle(state);
    });
  }

  FetchCpYarnsState get initial => FetchCpYarnsState.initial();
}

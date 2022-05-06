import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_linen_yarns_event.dart';
part 'fetch_linen_yarns_state.dart';

part 'fetch_linen_yarns_bloc.freezed.dart';

@injectable
class FetchLinenYarnsBloc extends Bloc<FetchLinenYarnsEvent, FetchLinenYarnsState> {
  FetchLinenYarnsBloc() : super(FetchLinenYarnsState.initial()) {
    on<FetchLinenYarnsEvent>((event, emit) {
      event.handle(state);
    });
  }

  FetchLinenYarnsState get initial => FetchLinenYarnsState.initial();
}

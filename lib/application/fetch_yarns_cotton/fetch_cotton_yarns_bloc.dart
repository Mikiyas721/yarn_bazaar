import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_cotton_yarns_event.dart';
part 'fetch_cotton_yarns_state.dart';

part 'fetch_cotton_yarns_bloc.freezed.dart';

@lazySingleton
class FetchCottonYarnsBloc extends Bloc<FetchCottonYarnsEvent, FetchCottonYarnsState> {
  FetchCottonYarnsBloc() : super(FetchCottonYarnsState.initial()) {
    on<FetchCottonYarnsEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  FetchCottonYarnsState get initial => FetchCottonYarnsState.initial();
}

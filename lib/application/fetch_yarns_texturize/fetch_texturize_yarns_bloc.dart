import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/yarn.dart';

part 'fetch_texturize_yarns_event.dart';
part 'fetch_texturize_yarns_state.dart';

part 'fetch_texturize_yarns_bloc.freezed.dart';

@lazySingleton
class FetchTexturizeYarnsBloc extends Bloc<FetchTexturizeYarnsEvent, FetchTexturizeYarnsState> {
  FetchTexturizeYarnsBloc() : super(FetchTexturizeYarnsState.initial()) {
    on<FetchTexturizeYarnsEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  FetchTexturizeYarnsState get initial => FetchTexturizeYarnsState.initial();
}

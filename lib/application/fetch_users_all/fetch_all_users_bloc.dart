import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';

part 'fetch_all_users_event.dart';
part 'fetch_all_users_state.dart';

part 'fetch_all_users_bloc.freezed.dart';

@lazySingleton
class FetchAllUsersBloc extends Bloc<FetchAllUsersEvent, FetchAllUsersState> {
  FetchAllUsersBloc() : super(FetchAllUsersState.initial()) {
    on<FetchAllUsersEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  FetchAllUsersState get initialState => FetchAllUsersState.initial();
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';

part 'fetch_trader_users_event.dart';
part 'fetch_trader_users_state.dart';

part 'fetch_trader_users_bloc.freezed.dart';

@injectable
class FetchTraderUsersBloc extends Bloc<FetchTraderUsersEvent, FetchTraderUsersState> {
  FetchTraderUsersBloc() : super(FetchTraderUsersState.initial()) {
    on<FetchTraderUsersEvent>((event, emit) {
      event.handle(state);
    });
  }

  FetchTraderUsersState get initialState => FetchTraderUsersState.initial();

}

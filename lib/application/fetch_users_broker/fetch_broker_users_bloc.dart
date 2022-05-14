import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';

part 'fetch_broker_users_event.dart';
part 'fetch_broker_users_state.dart';

part 'fetch_broker_users_bloc.freezed.dart';

@lazySingleton
class FetchBrokerUsersBloc extends Bloc<FetchBrokerUsersEvent, FetchBrokerUsersState> {
  FetchBrokerUsersBloc() : super(FetchBrokerUsersState.initial()) {
    on<FetchBrokerUsersEvent>((event, emit) {
      emit(event.handle(state));
    });
  }

  FetchBrokerUsersState get initialState => FetchBrokerUsersState.initial();
}

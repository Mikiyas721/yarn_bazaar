import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yarn_bazaar/common/bloc/bloc_helpers.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';

part 'fetch_mill_users_event.dart';
part 'fetch_mill_users_state.dart';

part 'fetch_mill_users_bloc.freezed.dart';

@injectable
class FetchMillUsersBloc extends Bloc<FetchMillUsersEvent, FetchMillUsersState> {
  FetchMillUsersBloc() : super(FetchMillUsersState.initial()) {
    on<FetchMillUsersEvent>((event, emit) {
      event.handle(state);
    });
  }

  FetchMillUsersState get initialState => FetchMillUsersState.initial();
}

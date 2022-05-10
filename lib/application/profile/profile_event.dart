part of 'profile_bloc.dart';

abstract class ProfileEvent extends BlocEvent<ProfileState> {}

class ProfileBuyerSelectedEvent extends ProfileEvent{
  @override
  Stream<ProfileState> handle(ProfileState currentState)async* {
    yield currentState.copyWith(selectedProfileIndex:0);
  }
}

class ProfileSellerSelectedEvent extends ProfileEvent{
  @override
  Stream<ProfileState> handle(ProfileState currentState)async* {
    yield currentState.copyWith(selectedProfileIndex:1);
  }
}

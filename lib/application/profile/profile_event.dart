part of 'profile_bloc.dart';

abstract class ProfileEvent extends BlocEvent<ProfileState> {}

class ProfileBuyerSelectedEvent extends ProfileEvent{
  @override
  ProfileState handle(ProfileState currentState) {
    return currentState.copyWith(selectedProfileIndex:0);
  }
}

class ProfileSellerSelectedEvent extends ProfileEvent{
  @override
  ProfileState handle(ProfileState currentState) {
    return currentState.copyWith(selectedProfileIndex:1);
  }
}

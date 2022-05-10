part of 'profile_bloc.dart';

@freezed
abstract class ProfileState extends BlocState with _$ProfileState {
  const factory ProfileState({
    required int selectedProfileIndex,
    required Option<AppUser> appUser,
  }) = _ProfileState;

  factory ProfileState.initial(){
    final splash = getIt.get<SplashBloc>();
    return ProfileState(selectedProfileIndex: 0, appUser: splash.state.appUser,);
  }
}

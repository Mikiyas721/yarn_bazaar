part of 'splash_bloc.dart';

@freezed
abstract class SplashState extends BlocState with _$SplashState{
  const factory SplashState({
    required Option<AppUser> appUser
  }) = _SplashState;

  factory SplashState.initial() => SplashState(appUser: none());

}

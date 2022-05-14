part of 'splash_bloc.dart';

abstract class SplashEvent extends BlocEvent<SplashState> {}

class SplashAppUserChangedEvent extends SplashEvent{
  final Option<AppUser> appUser;

  SplashAppUserChangedEvent(this.appUser);

  @override
  SplashState handle(SplashState currentState) {
    return currentState.copyWith(appUser: appUser);
  }

}

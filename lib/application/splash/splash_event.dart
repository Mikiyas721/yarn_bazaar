part of 'splash_bloc.dart';

abstract class SplashEvent extends BlocEvent<SplashState> {}

class SplashAppUserChangedEvent extends SplashEvent{
  final Option<AppUser> appUser;

  SplashAppUserChangedEvent(this.appUser);

  @override
  Stream<SplashState> handle(SplashState currentState) async*{
    yield currentState.copyWith(appUser: appUser);
  }

}

import 'package:flutter/material.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/use_cases/load_logged_in_user.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';

import '../../injection.dart';

class SplashController extends BlocController<SplashBloc, SplashEvent, SplashState> with DateTimeMixin {
  SplashController(BuildContext context) : super(context, getIt.get<SplashBloc>(), false);

  loadUser() async {
    final result = await getIt.get<LoadLoggedInUser>().execute();
    await delay(seconds: 1);
    result.fold(
      () {
        Navigator.pushNamedAndRemoveUntil(context, '/authPage', (a) => false);
      },
      (a) {
        bloc.add(SplashAppUserChangedEvent(result));
      },
    );
  }

  @override
  onStateChanged(SplashState previousState, SplashState currentState) {

    if (previousState.appUser.isNone() && currentState.appUser.isSome()) {
      Navigator.pushNamedAndRemoveUntil(context, '/homePage', (a) => false);
    } else if (previousState.appUser.isSome() && currentState.appUser.isNone()) {
      Navigator.pushNamedAndRemoveUntil(context, '/authPage', (a) => false);
    }
  }

}

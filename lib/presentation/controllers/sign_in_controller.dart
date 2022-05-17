import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/application/sign_in/sign_in_bloc.dart';
import 'package:yarn_bazaar/common/failure.dart';
import 'package:yarn_bazaar/domain/entities/credentials.dart';
import 'package:yarn_bazaar/domain/use_cases/cache_logged_in_user.dart';
import 'package:yarn_bazaar/domain/use_cases/sign_in_user.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/sign_in_view_model.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/pages/home_page.dart';
import 'package:yarn_bazaar/presentation/pages/sign_up_page.dart';

import '../../injection.dart';

class SignInController
    extends BlocViewModelController<SignInBloc, SignInEvent, SignInState, SignInViewModel>
    with ShortMessageMixin {
  SignInController(BuildContext context) : super(context, getIt.get<SignInBloc>(), true);

  @override
  SignInViewModel mapStateToViewModel(SignInState s) {
    return SignInViewModel(
      phoneNumber: s.phoneNumber.fold((l) => null, (r) => r.value),
      phoneNumberError:
          s.hasSubmittedCredentials ? s.phoneNumber.fold((l) => l.message, (r) => null) : null,
      password: s.password.fold((l) => null, (r) => r.value),
      passwordError:
          s.hasSubmittedCredentials ? s.password.fold((l) => l.message, (r) => null) : null,
      isShowingPassword: s.isShowingPassword,
      isVerifyingCredentials: s.isVerifyingCredentials,
    );
  }

  onPop() {
    if (!currentState.isVerifyingCredentials) {
      Navigator.pop(context);
    }
  }

  onCall() {}

  onPhoneNumber(String phoneNumber) {
    bloc.add(SignInPhoneNumberChangedEvent(phoneNumber));
  }

  onPassword(String password) {
    bloc.add(SignInPasswordChangedEvent(password));
  }

  onShowHidePassword(bool isShowing) {
    bloc.add(SignInPasswordVisibilityChangedEvent(isShowing));
  }

  onForgotPassword() {
    //TODO implement
  }

  onLogin() {
    bloc.add(SignInVerifyingCredentialsStartedEvent());
    bloc.add(SignInSubmittedCredentialsEvent());
    final credentials = Credentials.create(
      phoneNumber: bloc.state.phoneNumber.fold((l) => null, (r) => r.value),
      password: bloc.state.password.fold((l) => null, (r) => r.value),
    );
    credentials.fold(
      () {
        bloc.add(SignInVerifyingCredentialsStoppedEvent());
        toastError("Please enter valid inputs");
      },
      (a) async {
        final appUser = await getIt.get<SignInUser>().execute(a);
        appUser.fold((l) {
          bloc.add(SignInVerifyingCredentialsStoppedEvent());
          toastError(l.message);
        }, (r) async {
          final userWasCached = await getIt.get<CacheLoggedInUser>().execute(r);
          getIt.get<SplashBloc>().add(SplashAppUserChangedEvent(getOption(r)));
          bloc.add(SignInVerifyingCredentialsStoppedEvent());

          if (userWasCached) {
            Navigator.pushNamedAndRemoveUntil(context, HomePage.route, (route) => false);
          } else {
            showErrorSnackBar(
              context,
              'Unable to save logged in user. Proceed without saving?',
              onAction: () {
                Navigator.pushNamedAndRemoveUntil(context, HomePage.route, (route) => false);
              },
            );
          }
        });
      },
    );
  }

  onRegister() {
    Navigator.pushReplacementNamed(context, SignUpPage.route);
  }
}

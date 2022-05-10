import 'package:flutter/cupertino.dart';
import 'package:yarn_bazaar/application/sign_in/sign_in_bloc.dart';
import 'package:yarn_bazaar/domain/entities/credentials.dart';
import 'package:yarn_bazaar/domain/use_cases/cache_logged_in_user.dart';
import 'package:yarn_bazaar/domain/use_cases/login_user.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/toast_mixin.dart';
import 'package:yarn_bazaar/presentation/models/sign_in_view_model.dart';

import '../../injection.dart';

class SignInController
    extends BlocViewModelController<SignInBloc, SignInEvent, SignInState, SignInViewModel>
    with ToastMixin {
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

  onPhoneNumber(String phoneNumber) {
    bloc.add(SignInPhoneNumberChangedEvent(phoneNumber));
  }

  onPassword(String password) {
    bloc.add(SignInPasswordChangedEvent(password));
  }

  onShowHidePassword(bool isShowing) {
    bloc.add(SignInShowPasswordChangedEvent(isShowing));
  }

  onForgotPassword() {
    //TODO implement
  }

  onLogin() {
    bloc.add(SignInVerifyingCredentialsStartedEvent());
    final credentials =
        Credentials.create(phoneNumber: bloc.state.phoneNumber, password: bloc.state.password);
    credentials.fold(
      () {
        toastError("Please enter valid inputs");
      },
      (a) async {
        final appUser = await getIt.get<LoginUser>().execute(a);
        appUser.fold((l) {
          bloc.add(SignInVerifyingCredentialsStoppedEvent());
          toastError(l.message);
        }, (r) async {
          final userWasCached = await getIt.get<CacheLoggedInUser>().execute(r);
          bloc.add(SignInVerifyingCredentialsStoppedEvent());

          if (userWasCached) {
            Navigator.pushNamedAndRemoveUntil(context, '/homePage', (route) => false);
          } else {
            showErrorSnackBar(
              context,
              'Unable to save logged in user. Proceed without saving?',
              onAction: () {
                Navigator.pushNamedAndRemoveUntil(context, '/homePage', (route) => false);
              },
            );
          }
        });
      },
    );
  }
}

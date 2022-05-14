import 'package:flutter/material.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/models/edit_profile_view_model.dart';

class EditProfileController
    extends BlocViewModelController<SplashBloc, SplashEvent, SplashState, EditProfileViewModel> {
  EditProfileController(BuildContext context) : super(context, getIt.get<SplashBloc>(), false);

  @override
  EditProfileViewModel mapStateToViewModel(SplashState s) {
    return EditProfileViewModel(
      imageUrl: s.appUser.fold(() => '', (a) => a.imageUrl),
      username: s.appUser.fold(() => '', (a) => a.firstName.value ?? '') +
          ' ' +
          s.appUser.fold(() => '', (a) => a.lastName?.value ?? ''),
      workPlace: s.appUser.fold(() => '', (a) => a.companyName.value),
      profileCompletedInPercent: 30,
    );
  }

  onBasicProfile() {
    Navigator.pushNamed(context, '/editBasicProfilePage');
  }

  onBusinessDetails() {
    Navigator.pushNamed(context, '/editBusinessDetailsPage');
  }

  onBankDetails() {
    Navigator.pushNamed(context, '/editBankDetailsPage');
  }

  onChangePassword() {
    Navigator.pushNamed(context, '/editPasswordPage');
  }
}

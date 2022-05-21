import 'package:flutter/material.dart';
import 'package:yarn_bazaar/domain/use_cases/get_file_download_link.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/models/edit_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/pages/edit_bank_details_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_basic_profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_business_details_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_password_page.dart';

class EditProfileController extends BlocViewModelController<SplashBloc, SplashEvent,
    SplashState, EditProfileViewModel> {
  EditProfileController(BuildContext context) : super(context, getIt.get<SplashBloc>(), false);

  @override
  EditProfileViewModel mapStateToViewModel(SplashState s) {
    return EditProfileViewModel(
      imageUrl: s.appUser.fold(
          () => '',
          (a) => a.imageUrl == null
              ? null
              : getIt.get<GetFileDownloadLink>().execute('user', a.imageUrl!)),
      username: s.appUser.fold(() => '', (a) => a.firstName.value ?? '') +
          ' ' +
          s.appUser.fold(() => '', (a) => a.lastName?.value ?? ''),
      workPlace: s.appUser.fold(() => '', (a) => a.companyName.value),
      profileCompletedInPercent: 30,
    );
  }

  onEditProfile(){

  }

  onBasicProfile() {
    Navigator.pushNamed(context, EditBasicProfilePage.route);
  }

  onBusinessDetails() {
    Navigator.pushNamed(context, EditBusinessDetailPage.route);
  }

  onBankDetails() {
    Navigator.pushNamed(context, EditBankDetailsPage.route);
  }

  onChangePassword() {
    Navigator.pushNamed(context, EditPasswordPage.route);
  }
}

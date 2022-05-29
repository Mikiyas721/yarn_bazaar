import 'package:dio/dio.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/use_cases/get_file_download_link.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_basic_info.dart';
import 'package:yarn_bazaar/domain/use_cases/upload_file.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_profile_view_model.dart';
import 'package:yarn_bazaar/presentation/pages/edit_bank_details_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_basic_profile_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_business_details_page.dart';
import 'package:yarn_bazaar/presentation/pages/edit_password_page.dart';

class EditProfileController
    extends BlocViewModelController<SplashBloc, SplashEvent, SplashState, EditProfileViewModel>
    with ShortMessageMixin {
  EditProfileController(BuildContext context) : super(context, getIt.get<SplashBloc>(), false);

  @override
  EditProfileViewModel mapStateToViewModel(SplashState s) {
    return EditProfileViewModel(
      imageUrl: s.appUser.fold(
              () => '',
              (a) =>
          a.imageUrl == null
              ? null
              : getIt.get<GetFileDownloadLink>().execute(User.ContainerName, a.imageUrl!)),
      username: s.appUser.fold(() => '', (a) => a.firstName.value ?? '') +
          ' ' +
          s.appUser.fold(() => '', (a) => a.lastName?.value ?? ''),
      workPlace: s.appUser.fold(() => '', (a) => a.companyName.value),
      profileCompletedInPercent: 30,
    );
  }

  onEditProfilePic() async {
    try {
      FilePickerCross selectedFile =
      await FilePickerCross.importFromStorage(type: FileTypeCross.image);
      if (selectedFile.path == null || selectedFile.fileName == null) {
        toastError("Unable to use selected picture");
      } else {
        FormData formData = FormData.fromMap({
          "file":
          await MultipartFile.fromFile(selectedFile.path!, filename: selectedFile.fileName)
        });
        final fileUploadResponse =
        await getIt.get<UploadFile>().execute(User.ContainerName, formData);
        fileUploadResponse.fold((l) {
          toastError(l.message);
        }, (r) {
          currentState.appUser.fold(() {
            toastError("Unable to find cached user");
          }, (currentSavedAppUser) {
            User.createForUpdate(id: currentSavedAppUser.id, imageUrl: selectedFile.fileName)
                .fold(() {
              toastError("Invalid input(s)");
            }, (a) async {
              final profileUpdateResponse = await getIt.get<UpdateUserBasicInfo>().execute(a);
              profileUpdateResponse.fold((l) {
                toastError(l.message);
              }, (r) {
                bloc.add(SplashAppUserChangedEvent(AppUser.create(
                  id: currentSavedAppUser.id,
                  imageUrl: selectedFile.fileName,
                  firstName: currentSavedAppUser.firstName.value,
                  phoneNumber: currentSavedAppUser.phoneNumber.value,
                  lastName: currentSavedAppUser.lastName?.value,
                  companyName: currentSavedAppUser.companyName.value,
                  accountType: currentSavedAppUser.accountType,
                  categories: currentSavedAppUser.categories,
                  password: currentSavedAppUser.password?.value,
                  businessDetailId: currentSavedAppUser.businessDetailId,
                  bankDetailId: currentSavedAppUser.bankDetailId,
                )));
                toastSuccess("Updated Successfully");
              });
            });
          });
        });
      }
    } catch (e) {
      if (e is NullThrownError) {
        toastError("Problem with selected file");
      } else if (e is FileSelectionCanceledError) {
        toastInformation("File selection cancelled");
      } else {
        toastInformation(e.toString());
      }
    }
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

import 'package:flutter/material.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/app_user.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/use_cases/cache_logged_in_user.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_basic_information.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_basic_info.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_password_view_model.dart';
import 'package:yarn_bazaar/application/edit_password/edit_password_bloc.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class EditPasswordController extends BlocViewModelController<EditPasswordBloc,
    EditPasswordEvent, EditPasswordState, EditPasswordViewModel> with ShortMessageMixin, DateTimeMixin {
  EditPasswordController(BuildContext context)
      : super(context, getIt.get<EditPasswordBloc>(), true);

  @override
  EditPasswordViewModel mapStateToViewModel(EditPasswordState s) {
    return EditPasswordViewModel(
      oldPassword: s.oldPassword.fold((l) => null, (r) => r.value),
      oldPasswordError:
          s.hasSubmitted ? s.oldPassword.fold((l) => l.message, (r) => null) : null,
      isShowingOldPassword: s.isShowingOldPassword,
      newPassword: s.newPassword.fold((l) => null, (r) => r.value),
      newPasswordError:
          s.hasSubmitted ? s.newPassword.fold((l) => l.message, (r) => null) : null,
      isShowingNewPassword: s.isShowingNewPassword,
      isSaving: s.isSaving,
    );
  }

  onOldPassword(String oldPassword) {
    bloc.add(EditPasswordOldPasswordChangedEvent(oldPassword));
  }

  onShowOldPassword(bool show) {
    bloc.add(EditPasswordOldPasswordVisibilityChangedEvent(show));
  }

  onNewPassword(String newPassword) {
    bloc.add(EditPasswordNewPasswordChangedEvent(newPassword));
  }

  onShowNewPassword(bool show) {
    bloc.add(EditPasswordNewPasswordVisibilityChangedEvent(show));
  }

  onSave() {
    bloc.add(EditPasswordHasSubmittedEvent());
    bloc.add(EditPasswordStartedSavingEvent());
    final cachedAppUser = getIt.get<SplashBloc>().state.appUser;
    cachedAppUser.fold(() {
      bloc.add(EditPasswordStoppedSavingEvent());
      toastError("Operation failed: Cached user not found.");
    }, (a) async {
      if (currentState.oldPassword.isLeft() || currentState.newPassword.isLeft()) {
        bloc.add(EditPasswordStoppedSavingEvent());
        toastError("Operation failed: Invalid input(s)");
      } else if (currentState.oldPassword.fold((l) => null, (r) => r.value) ==
          currentState.newPassword.fold((l) => null, (r) => r.value)) {
        bloc.add(EditPasswordStoppedSavingEvent());
        toastError("Operation failed: Password should not match");
      } else {
        final user = await getIt.get<FetchSavedUserBasicInformation>().execute(a.id!);

        user.fold((l) {
          bloc.add(EditPasswordStoppedSavingEvent());
          toastError(l.message);
        }, (r) {
          if (r.password?.value != currentState.oldPassword.fold((l) => null, (r) => r.value)) {
            bloc.add(EditPasswordStoppedSavingEvent());
            toastError("Operation failed: Wrong Old Password entered");
          } else {
            final userToUpdate = User.createForUpdate(
              id: r.id,
              password: currentState.newPassword.fold((l) => null, (r) => r.value),
            );

            userToUpdate.fold(() {
              bloc.add(EditPasswordStoppedSavingEvent());
              toastError("Operation failed: Unable to create new data");
            }, (a) async {
              final apiResponse = await getIt.get<UpdateUserBasicInfo>().execute(a);
              bloc.add(EditPasswordStoppedSavingEvent());

              apiResponse.fold((l) {
                toastError(l.message);
              }, (r) async{
                final splashBloc = getIt.get<SplashBloc>();
                final newAppUser = AppUser.create(
                  id:splashBloc.state.appUser.fold(() => null, (a) => a.id),
                  imageUrl:splashBloc.state.appUser.fold(() => null, (a) => a.imageUrl),
                  firstName:splashBloc.state.appUser.fold(() => null, (a) => a.firstName.value),
                  phoneNumber:splashBloc.state.appUser.fold(() => null, (a) => a.phoneNumber.value),
                  lastName:splashBloc.state.appUser.fold(() => null, (a) => a.lastName?.value),
                  companyName:splashBloc.state.appUser.fold(() => null, (a) => a.companyName.value),
                  accountType:splashBloc.state.appUser.fold(() => null, (a) => a.accountType),
                  categories:splashBloc.state.appUser.fold(() => null, (a) => a.categories),
                  password:r.password?.value,
                  businessDetailId:splashBloc.state.appUser.fold(() => null, (a) => a.businessDetailId),
                  bankDetailId:splashBloc.state.appUser.fold(() => null, (a) => a.bankDetailId),
                );
                newAppUser.fold((){
                  toastError("Invalid input(s): Unable to update cache");
                }, (a)async{
                  splashBloc.add(SplashAppUserChangedEvent(newAppUser));
                  await getIt.get<UpdateCacheLoggedInUser>().execute(a);
                  toastSuccess("Successfully updated");
                });
                await delay(milliSeconds: 500);
                Navigator.pop(context);
              });
            });
          }
        });
      }
    });
  }
}

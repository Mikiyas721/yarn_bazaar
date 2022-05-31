import 'package:flutter/material.dart';
import 'package:yarn_bazaar/application/reset_password/reset_password_bloc.dart';
import 'package:yarn_bazaar/common/mixins/date_time_mixin.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_user_basic_information_by_phone_number.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_basic_info.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/reset_password_view_model.dart';
import 'package:yarn_bazaar/presentation/pages/sign_in_page.dart';

class ResetPasswordController extends BlocViewModelController<ResetPasswordBloc, ResetPasswordEvent,
    ResetPasswordState, ResetPasswordViewModel> with ShortMessageMixin, DateTimeMixin {
  final String phoneNumber;

  ResetPasswordController(
    BuildContext context,
    this.phoneNumber,
  ) : super(context, getIt.get<ResetPasswordBloc>(), true);

  @override
  ResetPasswordViewModel mapStateToViewModel(ResetPasswordState s) {
    return ResetPasswordViewModel(
      oldPassword: s.oldPassword.fold((l) => null, (r) => r.value),
      oldPasswordError: s.hasSubmitted ? s.oldPassword.fold((l) => l.message, (r) => null) : null,
      isShowingOldPassword: s.isShowingOldPassword,
      newPassword: s.newPassword.fold((l) => null, (r) => r.value),
      newPasswordError: s.hasSubmitted ? s.newPassword.fold((l) => l.message, (r) => null) : null,
      isShowingNewPassword: s.isShowingNewPassword,
      isSaving: s.isSaving,
    );
  }

  onOldPassword(String oldPassword) {
    bloc.add(ResetPasswordOldPasswordChangedEvent(oldPassword));
  }

  onShowOldPassword(bool show) {
    bloc.add(ResetPasswordOldPasswordVisibilityChangedEvent(show));
  }

  onNewPassword(String newPassword) {
    bloc.add(ResetPasswordNewPasswordChangedEvent(newPassword));
  }

  onShowNewPassword(bool show) {
    bloc.add(ResetPasswordNewPasswordVisibilityChangedEvent(show));
  }

  onSave() async {
    bloc.add(ResetPasswordHasSubmittedEvent());
    bloc.add(ResetPasswordStartedSavingEvent());
    if (bloc.state.oldPassword.isLeft() || bloc.state.newPassword.isLeft()) {
      bloc.add(ResetPasswordStoppedSavingEvent());
      toastError("Operation failed: Invalid input(s)");
    } else if (bloc.state.oldPassword.fold((l) => null, (r) => r.value) ==
        bloc.state.newPassword.fold((l) => null, (r) => r.value)) {
      bloc.add(ResetPasswordStoppedSavingEvent());
      toastError("Operation failed: Passwords should not match");
    } else {
      final user = await getIt.get<FetchUserBasicInformationByPhoneNumber>().execute(phoneNumber);

      user.fold((l) {
        bloc.add(ResetPasswordStoppedSavingEvent());
        toastError(l.message);
      }, (r) {
        if (r.password != bloc.state.oldPassword.fold((l) => null, (r) => r.value)) {
          bloc.add(ResetPasswordStoppedSavingEvent());
          toastError("Operation failed: Old Password does not match");
        } else {
          final userToUpdate = User.createForUpdate(
            id: r.id,
            password: currentState.newPassword.fold((l) => null, (r) => r.value),
          );

          userToUpdate.fold(() {
            bloc.add(ResetPasswordStoppedSavingEvent());
            toastError("Operation failed: Unable to create new data");
          }, (a) async {
            final apiResponse = await getIt.get<UpdateUserBasicInfo>().execute(a);
            bloc.add(ResetPasswordStoppedSavingEvent());

            apiResponse.fold((l) {
              toastError(l.message);
            }, (r) async {
              toastSuccess("Successfully updated");
              await delay(milliSeconds: 100);
              Navigator.pushNamedAndRemoveUntil(context, SignInPage.route, (route) => false);
            });
          });
        }
      });
    }
  }
}

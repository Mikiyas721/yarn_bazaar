import 'package:flutter/src/widgets/framework.dart';
import 'package:yarn_bazaar/domain/entities/user.dart';
import 'package:yarn_bazaar/domain/use_cases/fetch_saved_user_basic_information.dart';
import 'package:yarn_bazaar/domain/use_cases/update_user_basic_info.dart';
import 'package:yarn_bazaar/injection.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/short_message_mixin.dart';
import 'package:yarn_bazaar/presentation/models/edit_password_view_model.dart';
import 'package:yarn_bazaar/application/edit_password/edit_password_bloc.dart';
import 'package:yarn_bazaar/application/splash/splash_bloc.dart';

class EditPasswordController extends BlocViewModelController<EditPasswordBloc,
    EditPasswordEvent, EditPasswordState, EditPasswordViewModel> with ShortMessageMixin {
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
      if (bloc.state.oldPassword.isLeft() || bloc.state.newPassword.isLeft()) {
        bloc.add(EditPasswordStoppedSavingEvent());
        toastError("Operation failed: Invalid input(s)");
      } else if (bloc.state.oldPassword.fold((l) => null, (r) => r.value) ==
          bloc.state.newPassword.fold((l) => null, (r) => r.value)) {
        bloc.add(EditPasswordStoppedSavingEvent());
        toastError("Operation failed: Password should not match");
      } else {
        final user = await getIt.get<FetchSavedUserBasicInformation>().execute(a.id!);

        user.fold((l) {
          bloc.add(EditPasswordStoppedSavingEvent());
          toastError(l.message);
        }, (r) {
          if (r.password != bloc.state.oldPassword.fold((l) => null, (r) => r.value)) {
            bloc.add(EditPasswordStoppedSavingEvent());
            toastError("Operation failed: Old Password does not match");
          } else {
            final userToSave = User.create(
              id: r.id,
              imageUrl: r.imageUrl,
              firstName: r.firstName.value,
              lastName: r.lastName?.value,
              phoneNumber: r.phoneNumber.value,
              country: r.country,
              city: r.city,
              email: r.email?.value,
              website: r.website?.value,
              password: currentState.newPassword.fold((l) => null, (r) => r.value),
              createdAt: r.createdAt,
              updatedAt: r.updatedAt,
              businessDetail: r.businessDetail,
              bankDetail: r.bankDetail,
              yarns: r.yarns,
            );

            userToSave.fold(() {
              bloc.add(EditPasswordStoppedSavingEvent());
              toastError("Operation failed: Unable to create new data");
            }, (a) async {
              final apiResponse = await getIt.get<UpdateUserBasicInfo>().execute(a);
              bloc.add(EditPasswordStoppedSavingEvent());

              apiResponse.fold((l) {
                toastError(l.message);
              }, (r) {
                toastSuccess("Successfully updated");
              });
            });
          }
        });
      }
    });
  }
}

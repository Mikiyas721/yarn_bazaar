part of 'edit_password_bloc.dart';

@freezed
abstract class EditPasswordState extends BlocState with _$EditPasswordState {
  const factory EditPasswordState({
    required Either<PasswordFailure, Password> oldPassword,
    required bool isShowingOldPassword,
    required Either<PasswordFailure, Password> newPassword,
    required bool isShowingNewPassword,
    required bool hasSubmitted,
    required bool isSaving,
  }) = _EditPasswordState;

  factory EditPasswordState.initial() => EditPasswordState(
        oldPassword: Password.create(''),
        isShowingOldPassword: false,
        newPassword: Password.create(''),
        isShowingNewPassword: false,
        hasSubmitted: false,
        isSaving: false,
      );
}

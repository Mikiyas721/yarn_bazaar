part of 'reset_password_bloc.dart';

@freezed
abstract class ResetPasswordState extends BlocState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required Either<PasswordFailure, Password> oldPassword,
    required bool isShowingOldPassword,
    required Either<PasswordFailure, Password> newPassword,
    required bool isShowingNewPassword,
    required bool hasSubmitted,
    required bool isSaving,
  }) = _ResetPasswordState;

  factory ResetPasswordState.initial() => ResetPasswordState(
        oldPassword: Password.create(''),
        isShowingOldPassword: false,
        newPassword: Password.create(''),
        isShowingNewPassword: false,
        hasSubmitted: false,
        isSaving: false,
      );
}

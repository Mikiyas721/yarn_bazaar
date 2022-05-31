import 'package:yarn_bazaar/common/view_model.dart';

class ResetPasswordViewModel extends ViewModel {
  final String? oldPassword;
  final String? oldPasswordError;
  final bool isShowingOldPassword;
  final String? newPassword;
  final String? newPasswordError;
  final bool isShowingNewPassword;
  final bool isSaving;

  ResetPasswordViewModel({
    required this.oldPassword,
    required this.oldPasswordError,
    required this.isShowingOldPassword,
    required this.newPassword,
    required this.newPasswordError,
    required this.isShowingNewPassword,
    required this.isSaving,
  });

  @override
  List<Object?> get props => [
        oldPassword,
        oldPasswordError,
        isShowingOldPassword,
        newPassword,
        newPasswordError,
        isShowingNewPassword,
        isSaving,
      ];
}

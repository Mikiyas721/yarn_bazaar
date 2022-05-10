import 'package:yarn_bazaar/common/view_model.dart';

class EditPasswordViewModel extends ViewModel {
  final String? oldPassword;
  final String? oldPasswordError;
  final bool isShowingOldPassword;
  final String? newPassword;
  final String? newPasswordError;
  final bool isShowingNewPassword;
  final bool isSaving;

  EditPasswordViewModel({
    required this.oldPassword,
    this.oldPasswordError,
    required this.isShowingOldPassword,
    required this.newPassword,
    this.newPasswordError,
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

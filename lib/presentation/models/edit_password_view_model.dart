import 'package:yarn_bazaar/presentation/models/view_model.dart';

class EditPasswordViewModel extends ViewModel {
  final String oldPassword;
  final String? oldPasswordError;
  final bool isShowingOldPassword;
  final String newPassword;
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

  //TODO remove when controller setup
  factory EditPasswordViewModel.defaults() {
    return EditPasswordViewModel(
      oldPassword: '',
      isShowingOldPassword: false,
      newPassword: '',
      isShowingNewPassword: false,
      isSaving: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/edit_password_view_model.dart';
import 'package:yarn_bazaar/presentation/widgets/my_action_button.dart';
import 'package:yarn_bazaar/presentation/widgets/my_image_view.dart';
import 'package:yarn_bazaar/presentation/widgets/text_field_with_title.dart';
import 'package:yarn_bazaar/presentation/ui_extensions.dart';

class EditPasswordView extends StatelessWidget {
  final EditPasswordViewModel editPasswordViewModel;
  final Function(String oldPassword) onOldPassword;
  final Function(bool show) onShowOldPassword;
  final Function(String newPassword) onNewPassword;
  final Function(bool show) onShowNewPassword;
  final VoidCallback onSave;

  const EditPasswordView({
    Key? key,
    required this.editPasswordViewModel,
    required this.onOldPassword,
    required this.onShowOldPassword,
    required this.onNewPassword,
    required this.onShowNewPassword,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  20.vSpace,
                  MyImageView(height: 100),
                  40.vSpace,
                  TextFieldWithTitle(
                    title: 'Old Password',
                    errorMessage: editPasswordViewModel.oldPasswordError,
                    hintText: 'Old Password',
                    usesPrimaryColor: false,
                    fieldIsOptional: false,
                    obscureText: !editPasswordViewModel.isShowingOldPassword,
                    onChanged: onOldPassword,
                    suffixIcon: TextButton(
                        onPressed: () {
                          onShowOldPassword(
                              !editPasswordViewModel.isShowingOldPassword);
                        },
                        child: editPasswordViewModel.isShowingOldPassword
                            ? const Text('Hide')
                            : const Text('Show')),
                  ),
                  15.vSpace,
                  TextFieldWithTitle(
                      title: 'New Password',
                      errorMessage: editPasswordViewModel.newPasswordError,
                      hintText: 'New Password',
                      usesPrimaryColor: false,
                      fieldIsOptional: false,
                      obscureText: !editPasswordViewModel.isShowingNewPassword,
                      onChanged: onNewPassword,
                      suffixIcon: TextButton(
                          onPressed: () {
                            onShowNewPassword(
                                !editPasswordViewModel.isShowingNewPassword);
                          },
                          child: editPasswordViewModel.isShowingNewPassword
                              ? const Text('Hide')
                              : const Text('Show')))
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: MyActionButton(
              label: 'SAVE',
              onSubmit: onSave,
              isLoading: editPasswordViewModel.isSaving,
            ))
      ],
    );
  }
}

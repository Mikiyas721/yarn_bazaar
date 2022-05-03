import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/models/edit_password_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_password_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PopButton(),
        title: const Text('Change Password'),
      ),
      body: EditPasswordView(
        editPasswordViewModel: EditPasswordViewModel.defaults(),
        onOldPassword: (String oldPassword) {},
        onShowOldPassword: (bool show) {},
        onNewPassword: (String newPassword) {},
        onShowNewPassword: (bool show) {},
        onSave: () {},
      ),
    );
  }
}

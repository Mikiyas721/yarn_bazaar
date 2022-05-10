import 'package:flutter/material.dart';
import 'package:yarn_bazaar/presentation/controllers/edit_password_controller.dart';
import 'package:yarn_bazaar/presentation/controllers/shared/controller_provider.dart';
import 'package:yarn_bazaar/presentation/models/edit_password_view_model.dart';
import 'package:yarn_bazaar/presentation/views/edit_password_view.dart';
import 'package:yarn_bazaar/presentation/widgets/pop_button.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.withController<EditPasswordViewModel, EditPasswordController>(
        create: () => EditPasswordController(context),
        builder: (context, controller, viewModel) {
          return Scaffold(
            appBar: AppBar(
              leading: const PopButton(),
              title: const Text('Change Password'),
            ),
            body: EditPasswordView(
              editPasswordViewModel: viewModel!,
              onOldPassword: controller.onOldPassword,
              onShowOldPassword: controller.onShowOldPassword,
              onNewPassword: controller.onNewPassword,
              onShowNewPassword: controller.onShowNewPassword,
              onSave: controller.onSave,
            ),
          );
        });
  }
}
